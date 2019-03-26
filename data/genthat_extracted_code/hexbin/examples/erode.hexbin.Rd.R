library(hexbin)


### Name: erode.hexbin
### Title: Erosion of a Hexagon Count Image
### Aliases: erode erode.hexbin erode,hexbin-method erodebin-class
### Keywords: hplot

### ** Examples

set.seed(153)
x <- rnorm(10000)
y <- rnorm(10000)
bin <- hexbin(x,y)

smbin  <- smooth.hexbin(bin)
erodebin <- erode.hexbin(smbin, cdfcut=.5)
plot(erodebin)

## bivariate boxplot
hboxplot(erodebin, main = "hboxplot(erodebin)")


# show erosion order
plot(bin,style= "lat", minarea=1, maxarea=1,
     legend=FALSE, border=gray(.7))

grid.hexagons(erodebin,style= "lat", minarea=1, maxarea=1,pen="green")
xy <- hcell2xy(erodebin)
library("grid")
grid.text(lab = as.character(erodebin@erode), xy$x, xy$y,
          gp = gpar(col="white", cex=0.65))




