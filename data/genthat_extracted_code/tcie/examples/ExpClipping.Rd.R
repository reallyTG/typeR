library(tcie)


### Name: ExpClipping
### Title: Builds and exports the mesh representing the desired isosurface
###   of an specific region of the dataset
### Aliases: ExpClipping

### ** Examples

ExpClipping(system.file("extdata","f3.nhdr",package ="tcie"),0,FALSE,c(2,3),c(2,4),c(2,4),"m.ply")
ExpClipping(system.file("extdata","f3.nhdr",package ="tcie"),0,TRUE,c(2,3),c(2,4),c(2,4),"m.ply")
ExpClipping(system.file("extdata","f9.nhdr",package ="tcie"),0,TRUE,c(1,5),c(2,4),c(3,5),"m.ply")



