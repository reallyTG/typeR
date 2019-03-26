library(gplots)


### Name: hist2d
### Title: Compute and Plot a 2-Dimensional Histogram
### Aliases: hist2d print.hist2d
### Keywords: dplot hplot

### ** Examples

   ## example data, bivariate normal, no correlation
   x <- rnorm(2000, sd=4)
   y <- rnorm(2000, sd=1)

   ## separate scales for each axis, this looks circular
   hist2d(x,y)

   ## same scale for each axis, this looks oval
   hist2d(x,y, same.scale=TRUE)

   ## use different ## bins in each dimension
   hist2d(x,y, same.scale=TRUE, nbins=c(100,200) )

   ## use the hist2d function to create an h2d object
   h2d <- hist2d(x,y,show=FALSE, same.scale=TRUE, nbins=c(20,30))

   ## show object summary
   h2d

   ## object contents
   str(h2d)

   ## perspective plot
   persp( h2d$x, h2d$y, h2d$counts,
          ticktype="detailed", theta=30, phi=30,
          expand=0.5, shade=0.5, col="cyan", ltheta=-30)

   ## for contour (line) plot ...
   contour( h2d$x, h2d$y, h2d$counts, nlevels=4 )

   ## for a filled contour plot ...
   filled.contour( h2d$x, h2d$y, h2d$counts, nlevels=4,
                   col=gray((4:0)/4) )






