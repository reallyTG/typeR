library(RobinHood)


### Name: get_order_status
### Title: Get a current status of an order on RobinHood
### Aliases: get_order_status

### ** Examples

## Not run: 
##D # Login in to your RobinHood account
##D RH <- RobinHood("username", "password")
##D 
##D # Place an order, should generate an email confirmation
##D x <- place_order(RH = RH,
##D                  symbol = "GE",          # Ticker symbol you want to trade
##D                  type = "market",        # Type of market order
##D                  time_in_force = "gfd",  # Time period the order is good for (gfd: good for day)
##D                  trigger = "immediate",  # Trigger or delay order
##D                  price = 8.96,           # The highest price you are willing to pay
##D                  quantity = 1,           # Number of shares you want
##D                  side = "buy")           # buy or sell
##D 
##D get_order_status(RH, x$url)
## End(Not run)



