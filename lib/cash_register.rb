class CashRegister
    attr_accessor :total, :discount, :item, :last_transaction, :last_items_array

    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items_array = []
    end
    
    def add_item(title, price, quantity = 1)
      capacity = quantity
      while capacity != 0 do
        @items_array << title
        capacity -=1
      end
        @last_items_added = @items_array.clone
    self.total += price * quantity
    @last_transaction = price * quantity
    @last_items_added.slice! -quantity, quantity 
    end




    def apply_discount
    if @discount != 0
    @total = @total.to_f - @total.to_f * @discount.to_f / 100.00 
    "After the discount, the total comes to $#{@total.to_i}."
    else
    "There is no discount to apply."
    end
    end

  def items   
    @items_array
  end

  def void_last_transaction
    @items_array = @last_items_added

    @total -= @last_transaction
    end

end