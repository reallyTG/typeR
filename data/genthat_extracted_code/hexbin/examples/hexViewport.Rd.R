library(hexbin)


### Name: hexViewport
### Title: Compute a Grid Viewport for Hexagon / Hexbin Graphics
### Aliases: hexViewport
### Keywords: hplot aplot

### ** Examples

set.seed(131)
x <- rnorm(7777)
y <- rt   (7777, df=3)

## lower resolution binning and overplotting with counts
bin <- hexbin(x,y,xbins=25)
P <- plot(bin)
xy <- hcell2xy(bin)
pushHexport(P$plot.vp)
i <- bin@count <= 3
library("grid")
grid.text(as.character(bin@count[i]), xy$x[i], xy$y[i],
          default.units = "native")
grid.points(x[1:20],y[1:20]) # to show some points rather than counts
popViewport()



