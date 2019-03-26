library(leafletCN)


### Name: read.geoShape
### Title: Read geoshape file into R
### Aliases: read.geoShape

### ** Examples

if(require(sp)){
  filePath = system.file("geojson/china.json",package = "leafletCN")
  map = read.geoShape(filePath)
  plot(map)
}



