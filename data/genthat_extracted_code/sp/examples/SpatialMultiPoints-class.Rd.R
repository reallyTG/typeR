library(sp)


### Name: SpatialMultiPoints-class
### Title: Class "SpatialMultiPoints"
### Aliases: SpatialMultiPoints-class [,SpatialMultiPoints-method
###   coerce,SpatialMultiPoints,matrix-method
###   coerce,SpatialMultiPoints,data.frame-method
###   coerce,SpatialMultiPoints,SpatialPoints-method
###   show,SpatialMultiPoints-method as.data.frame.SpatialMultiPoints
###   plot,SpatialMultiPoints,missing-method
###   summary,SpatialMultiPoints-method print.SpatialMultiPoints
###   summary.SpatialMultiPoints rbind.SpatialMultiPoints
###   $,SpatialMultiPoints-method $<-,SpatialMultiPoints,character-method
###   row.names.SpatialMultiPoints
### Keywords: classes

### ** Examples

cl1 = cbind(rnorm(3, 10), rnorm(3, 10))
cl2 = cbind(rnorm(5, 10), rnorm(5,  0))
cl3 = cbind(rnorm(7,  0), rnorm(7, 10))

mp = SpatialMultiPoints(list(cl1, cl2, cl3))
plot(mp, col = 2, cex = 1, pch = 1:3)
mp
mp[1:2]

print(mp, asWKT=TRUE, digits=3)



