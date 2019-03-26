library(mapReasy)


### Name: mapReasy-package
### Title: Producing Administrative Boundary Map with Additional Features
###   Embedded
### Aliases: mapReasy-package mapReasy
### Keywords: Disease mapping longitude-latitude track Bubble plot on
###   diseases map Comparison of factors on map

### ** Examples

color10(5)

filePATH <- system.file("Bangladesh", package="mapReasy")
map.country(shapedir= filePATH, shapename="BGD_adm1",boundary.label="NAME_1")

map.country(shapedir= filePATH, shapename="BGD_adm1",boundary.label="NAME_1",
spe.vector=c("Dhaka","Sylhet","Khulna"),col=color10(3))
           



