library(ggmap)


### Name: mutate_geocode
### Title: Geocode a dataset
### Aliases: mutate_geocode

### ** Examples



df <- data.frame(
  address = c("1600 Pennsylvania Avenue, Washington DC", "", "houston texas"),
  stringsAsFactors = FALSE
)

## Not run: 
##D  # Server response can be slow; this cuts down check time.
##D mutate_geocode(df, address)
##D 
##D 
##D library(dplyr)
##D df %>% mutate_geocode(address)
## End(Not run)




