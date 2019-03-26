library(KODAMA)


### Name: helicoid
### Title: Helicoid Data Set Generator
### Aliases: helicoid
### Keywords: dataset

### ** Examples

require("rgl")
x=helicoid()
open3d()
plot3d(x, col=rainbow(1000),box=FALSE,size=3)
rgl.postscript("helicoid.pdf", fmt="pdf")



