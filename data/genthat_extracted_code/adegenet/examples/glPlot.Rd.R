library(adegenet)


### Name: glPlot
### Title: Plotting genlight objects
### Aliases: glPlot plot.genlight plot,genlight-method
###   plot,genlight,ANY-method
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## simulate data
##D x <- glSim(100, 1e3, n.snp.struc=100, ploid=2)
##D 
##D ## default plot
##D glPlot(x)
##D plot(x) # identical plot
##D 
##D ## disable legend
##D plot(x, leg=FALSE)
##D 
##D ## use other colors
##D plot(x, col=heat.colors(3), bg="white")
## End(Not run)



