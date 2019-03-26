library(openadds)


### Name: oa_combine
### Title: Combine data helper
### Aliases: oa_combine

### ** Examples

## Not run: 
##D dat <- oa_list()
##D 
##D out1 <- oa_get(dat$processed[5])
##D out2 <- oa_get(dat$processed[35])
##D (alldat <- oa_combine(out1, out2))
##D 
##D out4 <- oa_get(dat$processed[788])
##D (alldat <- oa_combine(out2, out4))
##D 
##D if (!requireNamespace("leaflet")) {
##D   install.packages("leaflet")
##D }
##D library("leaflet")
##D leaflet(alldat) %>%
##D   addTiles() %>%
##D   addCircles(lat = ~lat, lng = ~lon, popup = ~address)
## End(Not run)



