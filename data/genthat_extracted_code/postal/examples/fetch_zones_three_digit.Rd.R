library(postal)


### Name: fetch_zones_three_digit
### Title: Get 3 digit zones
### Aliases: fetch_zones_three_digit

### ** Examples

## Not run: 
##D 
##D # All destination zips are returned for this origin
##D a_zip <- fetch_zones_three_digit("123")
##D nrow(a_zip)
##D 
##D # Only the zone corresponding to this origin and this destination are returned
##D fetch_zones_three_digit("123", "456", show_details = TRUE)
##D 
##D fetch_zones_three_digit("007", as_range = TRUE)
##D 
##D # Get multiple zips
##D c("897", "786") %>%
##D   purrr::map_df(fetch_zones_three_digit)
##D 
## End(Not run)




