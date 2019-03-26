library(multifluo)


### Name: img.zone
### Title: Converts a zone object (point list) into a matrix
### Aliases: img.zone

### ** Examples


data(zones)
data(count)
zone.imgRect=img.zone(zone=zones,d=dim(count))
## No test: 
plotimage(mat=zone.imgRect,z=T)
## End(No test)




