library(tfplot)


### Name: tfVisPlot
### Title: Plot Tframed Objects using googleVis
### Aliases: tfVisPlot
### Keywords: ts plot

### ** Examples

 ## Not run: 
##D   z <- ts(matrix(rnorm(1000),100,10), start=c(1982,1), frequency=12)
##D   seriesNames(z) <- paste("Series", 1:10) 
##D   if (requireNamespace("googleVis")) 
##D      tfVisPlot(z, options=list(title="Random Number Series"))
##D   
## End(Not run)



