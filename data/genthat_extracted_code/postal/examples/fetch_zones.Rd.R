library(postal)


### Name: fetch_zones
### Title: Fetch zones for a 3-digit origin zip or an origin-destination
###   pair
### Aliases: fetch_zones

### ** Examples

## Not run: 
##D 
##D a_zip <- fetch_zones("123")
##D nrow(a_zip)
##D 
##D fetch_zones("123", "456", show_details = TRUE)
##D 
##D (double_oh_seven <- fetch_zones("007", as_range = TRUE))
## End(Not run)




