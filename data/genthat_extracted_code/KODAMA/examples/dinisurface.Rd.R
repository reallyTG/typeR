library(KODAMA)


### Name: dinisurface
### Title: Ulisse Dini Data Set Generator
### Aliases: dinisurface
### Keywords: dataset

### ** Examples

require("rgl")
x=dinisurface()
open3d()
plot3d(x, col=rainbow(1000),box=FALSE,size=3)
rgl.postscript("dinisurface.pdf", fmt="pdf")



