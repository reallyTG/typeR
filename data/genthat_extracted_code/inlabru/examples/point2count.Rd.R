library(inlabru)


### Name: point2count
### Title: Convert a plot sample of points into one of counts.
### Aliases: point2count

### ** Examples

## No test: 
# Some features require the raster package
if (require("raster", quietly = TRUE)) {

data(gorillas, package = "inlabru")
plotpts = plotsample(gorillas$nests,gorillas$boundary,x.ppn=0.4,y.ppn=0.4,nx=5,ny=5)
p1 = ggplot() +gg(plotpts$plots) +gg(plotpts$dets) +gg(gorillas$boundary)
countdata = point2count(plotpts$plots,plotpts$dets)
x=coordinates(countdata)[,1]
y=coordinates(countdata)[,2]
count=countdata@data$n
p2 = ggplot() +gg(gorillas$boundary) +gg(plotpts$plots) +  geom_text(aes(label=count, x=x, y=y))
multiplot(p1,p2,cols=2)

}
## End(No test)




