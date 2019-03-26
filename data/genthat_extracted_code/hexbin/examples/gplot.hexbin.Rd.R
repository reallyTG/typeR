library(hexbin)


### Name: gplot.hexbin
### Title: Plotting Hexagon Cells with a Legend
### Aliases: gplot.hexbin plot,hexbin,missing-method
### Keywords: hplot

### ** Examples

## 1) simple binning of spherical normal:
x <- rnorm(10000)
y <- rnorm(10000)
bin <- hexbin(x,y)

## Plot method for hexbin !
## ---- ------     --------
plot(bin)
# nested lattice
plot(bin, style= "nested.lattice")

# controlling the colorscheme
plot(bin, colramp=BTY, colorcut=c(0,.1,.2,.3,.4,.6,1))

## 2) A mixture distribution
x <- c(rnorm(5000),rnorm(5000,4,1.5))
y <- c(rnorm(5000),rnorm(5000,2,3))
bin <- hexbin(x,y)

pens <- cbind(c("#ECE2F0","#A6BDDB","#1C9099"),
              c("#FFF7BC","#FEC44F","#D95F0E"))
plot(bin, style = "nested.lattice", pen=pens)
# now really crazy
plot(bin, style = "nested.lattice", pen=pens,border=2,density=35)

# lower resolution binning and overplotting with counts
bin <- hexbin(x,y,xbins=25)
P <- plot(bin, style="lattice", legend=FALSE,
          minarea=1, maxarea=1, border="white")
##
library("grid")
pushHexport(P$plot.vp)
xy <- hcell2xy(bin)
  # to show points rather than counts :
grid.points(x,y,pch=18,gp=gpar(cex=.3,col="green"))
grid.text(as.character(bin@count), xy$x,xy$y,
          gp=gpar(cex=0.3, col="red"),default.units="native")
popViewport()

# Be creative, have fun!



