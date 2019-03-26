library(RobinHood)


### Name: cancel_order
### Title: Cancel an existing order on RobinHood
### Aliases: cancel_order

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
##D # Cancel the order, should also generate an email confirmation
##D cancel_order(RH, x$cancel)
## End(Not run)



