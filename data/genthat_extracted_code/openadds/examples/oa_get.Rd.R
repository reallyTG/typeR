library(openadds)


### Name: oa_get
### Title: Get data from Openaddresses
### Aliases: oa_get

### ** Examples

## Not run: 
##D (out1 <- oa_get("http://data.openaddresses.io/runs/142103/at/tirol.zip"))
##D (out2 <-
##D   oa_get("http://data.openaddresses.io/runs/142676/ca/bc/victoria.zip"))
##D 
##D # from a openadd class object
##D oa_get(as_openadd(country="us", state="nv", city="las_vegas"))
##D 
##D # combine data sets
##D (alldat <- oa_combine(out1, out2))
##D 
##D # Map data
##D if (!requireNamespace("leaflet")) {
##D   install.packages("leaflet")
##D }
##D library(leaflet)
##D small <- out2[[1]][1:5000,]
##D leaflet(small) %>%
##D   addTiles() %>%
##D   addCircles(lat = ~LAT, lng = ~LON,
##D              popup = unname(apply(small[, c('NUMBER', 'STREET')], 1,
##D              paste, collapse = " ")))
## End(Not run)



