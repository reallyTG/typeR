library(KODAMA)


### Name: swissroll
### Title: Swiss Roll Data Set Generator
### Aliases: swissroll
### Keywords: dataset

### ** Examples

require("rgl")
x=swissroll()
open3d()
plot3d(x, col=rainbow(1000),box=FALSE,size=3)
rgl.postscript("swissroll.pdf", fmt="pdf")



