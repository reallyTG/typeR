library(mapReasy)


### Name: country.regionTRAC
### Title: Longitude and latitude tracking on administrative boundary map
###   and subset of adminstrative boundary map
### Aliases: country.regionTRAC
### Keywords: longitude-latitude track

### ** Examples


filePATH <- system.file("Bangladesh", package="mapReasy")

country.regionTRAC(shapedir=filePATH, shapename="BGD_adm1",boundary.label="NAME_1",
spc.level=c("Khulna","Dhaka","Rangpur","Sylhet"))



