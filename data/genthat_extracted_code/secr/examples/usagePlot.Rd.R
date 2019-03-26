library(secr)


### Name: usagePlot
### Title: Plot usage, detections or sightings.
### Aliases: usagePlot sightingPlot
### Keywords: hplot

### ** Examples


simgrid <- make.grid(nx = 10, ny = 10, detector = "proximity")
usage(simgrid) <- matrix(rep(1:10, 50), nrow = 100, ncol = 5)
usagePlot(simgrid, border = 20, scale = 1.5, fill = FALSE,
  metres = FALSE)

# It is hard to get the legend just right
# here is one attempt
legend (x = -50, y = 185, legend = c(1,2,5,10), pch = 1, pt.cex =
  c(1,2,5,10)^0.5 * 1.5, x.intersp = 3, y.intersp = 1.8, adj = 1,
  bty = "n", title = "Usage")

usagePlot(simgrid, occasion = NULL, border = 20, scale = 1.5, fill = FALSE,
  metres = FALSE)

## Not run: 
##D # bubble plot in package 'sp'
##D library(sp)
##D simgrid$usage <- usage(simgrid)[,1]  ## occasion 1
##D class(simgrid) <- "data.frame"
##D coordinates(simgrid) <- c("x","y")
##D bubble(simgrid)   
## End(Not run)




