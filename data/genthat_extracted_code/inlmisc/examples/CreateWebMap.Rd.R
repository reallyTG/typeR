library(inlmisc)


### Name: CreateWebMap
### Title: Create a Web Map Using TNM Services
### Aliases: CreateWebMap
### Keywords: hplot

### ** Examples

map <- CreateWebMap(collapsed = FALSE)
lng <- c(-112.049705, -122.171257, -77.367458, -149.803565, -80.248344)
lat <- c(43.517810, 37.456526, 38.947206, 61.187905, 26.080860)
map <- leaflet::addMarkers(map, lng, lat)
map




