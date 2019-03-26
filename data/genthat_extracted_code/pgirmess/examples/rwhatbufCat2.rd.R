library(pgirmess)


### Name: rwhatbufCat2
### Title: Extract the contents of a raster file of categorical values
###   within various buffer sizes centred on spatial points
### Aliases: rwhatbufCat2
### Keywords: spatial

### ** Examples


library(sp)

myrastername<-system.file("pictures/SP27GTIF.TIF", package = "rgdal")[1]

mylocations<-structure(list(x = c(694728, 684662, 702339, 691819, 700091), 
y = c(1906654, 1886491, 1884426, 1884373, 1886872)),
.Names = c("x", "y"), row.names = c(NA, -5L), class = "data.frame")

coordinates(mylocations)<-~x+y

result<-rwhatbufCat2(myrastername,mylocations,c(500,1000))
result

result<-rwhatbufCat2(myrastername,mylocations,c(500,1000),asList=TRUE)
result[[1]] # results for buffer 500 (5 buffer centers)
result[[2]] # results for buffer 1000 (5 buffer centers)




