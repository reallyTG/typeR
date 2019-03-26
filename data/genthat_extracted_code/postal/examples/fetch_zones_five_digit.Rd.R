library(postal)


### Name: fetch_zones_five_digit
### Title: Fetch zones for a 5-digit origin origin-destination pair
### Aliases: fetch_zones_five_digit

### ** Examples

## Not run: 
##D fetch_zones_five_digit("90210", "20500")
##D 
##D fetch_zones_five_digit("40360", "09756",
##D                        show_details = TRUE)
##D 
##D # Supply multiple origins and destinations
##D purrr::map2_dfr(c("11238", "60647", "80205"),
##D                 c("98109", "02210", "94707"),
##D       fetch_zones_five_digit)
## End(Not run)




