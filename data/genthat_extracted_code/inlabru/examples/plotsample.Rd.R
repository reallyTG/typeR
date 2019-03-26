library(inlabru)


### Name: plotsample
### Title: Create a plot sample.
### Aliases: plotsample

### ** Examples

## No test: 
# Some features require the raster package
if (require("raster", quietly = TRUE)) {

data(gorillas, package = "inlabru")
plotpts = plotsample(gorillas$nests,gorillas$boundary,x.ppn=0.4,y.ppn=0.4,nx=5,ny=5)
ggplot() +gg(plotpts$plots) +gg(plotpts$dets,pch="+",cex=2) +gg(gorillas$boundary)

}
## End(No test)




