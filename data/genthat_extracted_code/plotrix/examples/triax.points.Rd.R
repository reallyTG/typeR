library(plotrix)


### Name: triax.points
### Title: Triangle plot points
### Aliases: triax.points
### Keywords: misc

### ** Examples

 data(soils)
 triax.return<-triax.plot(soils[1:10,],
  main="Adding points to a triangle plot",no.add=FALSE)
 triax.points(soils[11:20,],col.symbols="green",pch=3)
 par(triax.return$oldpar)



