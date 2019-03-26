library(RobinHood)


### Name: watchlist
### Title: Manage your RobinHood watchlist
### Aliases: watchlist

### ** Examples

## Not run: 
##D # Login in to your RobinHood account
##D RH <- RobinHood("username", "password")
##D 
##D # Get a vector of your watchlist names
##D watchlist(RH, action = "get")
##D 
##D # Get a vectors of symbols on your watchlist
##D watchlist(RH, action = "get", watchlist = "Default")
##D 
##D # Add a symbol to your watchlist
##D watchlist(RH, action = "add", watchlist = "Default", ticker = "CAT")
##D 
##D # Delete a symbol from your watchlist
##D watchlist(RH, action = "delete", watchlist = "Default", ticker = "CAT")
## End(Not run)



