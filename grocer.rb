require "pry"
=begin 
consolidate_cart
    adds a count of one to each item when there are no duplicates (FAILED - 1)
    increments count when there are multiple items (FAILED - 2)
=end 

def consolidate_cart(cart)
      a2 =[]
      cart.each do |hash|
        a2 << hash.keys
      end
      a3 = a2.flatten.inject(Hash.new(0)) do |collection, value|
        collection[value] = collection[value] + 1
        collection
      end
  
      cart.each do |hash|
        hash.each do |item, stats|
            stats[:count] = a3[item]
        end
      end
      
  result_hash = {}
    cart.each do |hash|
      hash.each do |item, stats|
        result_hash[item] = stats
      end
    end
  
result_hash
end



def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon.each do |stat, value|
      
      if cart.keys.any? {|x| x == value}
        cart[value][:count] = cart[value][:count]- coupon[:num]
        
        cart["#{value} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[value][:clearance], :count => 1}
      end
    end
  end
cart
end

def apply_clearance(cart)
  
  cart.each do |item, attributes|
    if cart[item][:clearance] == true
      cart[item][:price] *= 0.8
      cart[item][:price] = cart[item][:price].round(2)
    end
  end
end

=begin
Create a checkout method that calculates the total cost of the consolidated cart.
When checking out, follow these steps in order:
Apply coupon discounts if the proper number of items are present.
Apply 20% discount if items are on clearance.
If, after applying the coupon discounts and the clearance discounts, the cart's total is over $100, then apply a 10% discount.
=end

def checkout(cart, coupons)
  # code here
end
