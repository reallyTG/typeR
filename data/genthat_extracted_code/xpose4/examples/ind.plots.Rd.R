library(xpose4)


### Name: ind.plots
### Title: Observations (DV), individual predictions (IPRED) and population
###   predictions (PRED) are plotted against the independent variable for
###   every individual in the dataset, for Xpose 4
### Aliases: ind.plots
### Keywords: methods

### ** Examples

## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## Monochrome, suitable for manuscript or report
ind.plots(xpdb, 
  subset="ID>40 & ID<57", 
  col=c(1,1,1), 
  lty=c(0,2,3), 
  strip=function(..., bg) 
    strip.default(..., bg="grey"))
    
## Not run: 
##D     
##D ## IF we simulate in NONMEM using a dense grid of time points
##D ## and all non-observed DV items are equal to zero.
##D ind.plots(xpdb,inclZeroWRES=TRUE,y.vals.subset=c("DV!=0","NULL","NULL"))
##D 
##D 
##D # to plot individual plots of multiple variables
##D ind.plots(xpdb,subset="FLAG==1")
##D ind.plots(xpdb,subset="FLAG==2")
## End(Not run)




