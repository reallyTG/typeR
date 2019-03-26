library(sp)


### Name: SpatialLines-class
### Title: a class for spatial lines
### Aliases: SpatialLines-class [,SpatialLines-method
###   plot,SpatialLines,missing-method summary,SpatialLines-method
###   rbind.SpatialLines coerce,SpatialLines,SpatialPoints-method
###   coerce,SpatialLines,SpatialPointsDataFrame-method
###   coerce,Lines,SpatialPoints-method
###   coerce,Lines,SpatialMultiPoints-method
###   coerce,SpatialLines,SpatialMultiPoints-method
###   coerce,deldir,SpatialLines-method row.names.SpatialLines
### Keywords: classes

### ** Examples
 
# from the sp vignette:
l1 = cbind(c(1,2,3),c(3,2,2))
rownames(l1) = letters[1:3]
l1a = cbind(l1[,1]+.05,l1[,2]+.05)
rownames(l1a) = letters[1:3]
l2 = cbind(c(1,2,3),c(1,1.5,1))
rownames(l2) = letters[1:3]
Sl1 = Line(l1)
Sl1a = Line(l1a)
Sl2 = Line(l2)
S1 = Lines(list(Sl1, Sl1a), ID="a")
S2 = Lines(list(Sl2), ID="b")
Sl = SpatialLines(list(S1,S2))
summary(Sl)
plot(Sl, col = c("red", "blue"))



