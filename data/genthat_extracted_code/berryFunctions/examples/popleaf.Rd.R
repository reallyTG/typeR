library(berryFunctions)


### Name: popleaf
### Title: create leaflet popup box info
### Aliases: popleaf
### Keywords: aplot

### ** Examples

dat <- data.frame(a=14:16, b=letters[14:16], c=LETTERS[14:16],
                 lat=c(52.58,53.45,52.4), lon=c(6.34,7.23,13.05))
popleaf(dat)
dat$display <- popleaf(dat, 1:4)

## Not run: 
##D  # Excluded from CRAN checks
##D library(leaflet)
##D leaflet(dat) %>% addTiles() %>% addCircleMarkers(~lon, ~lat, popup=~display)
## End(Not run)




