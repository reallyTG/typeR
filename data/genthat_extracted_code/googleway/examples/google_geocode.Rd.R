library(googleway)


### Name: google_geocode
### Title: Google geocoding
### Aliases: google_geocode

### ** Examples

## Not run: 
##D 
##D set_key("YOUR_GOOGLE_API_KEY")
##D df <- google_geocode(address = "MCG, Melbourne, Australia",
##D                      simplify = TRUE)
##D 
##D df$results$geometry$location
##D         lat      lng
##D 1 -37.81659 144.9841
##D 
##D ## using bounds
##D bounds <- list(c(34.172684,-118.604794),
##D                c(34.236144,-118.500938))
##D 
##D js <- google_geocode(address = "Winnetka",
##D                      bounds = bounds,
##D                      simplify = FALSE)
##D 
##D ## using components
##D components <- data.frame(component = c("postal_code", "country"),
##D                          value = c("3000", "AU"))
##D 
##D df <- google_geocode(address = "Flinders Street Station",
##D                    components = components,
##D                    simplify = FALSE)
##D 
## End(Not run)



