library(ILS)


### Name: plot.ils.fqcdata
### Title: Plotting method for 'ils.fqcdata' objects
### Aliases: plot.ils.fqcdata

### ** Examples

## Not run: 
##D library(ILS)
##D data(TG)
##D delta <- seq(from = 40 ,to = 850 ,length.out = 1000 )
##D fqcdata <- ils.fqcdata(TG, p = 7, argvals = delta)
##D windows()
##D xlab <- "Temperature (C)"
##D ylab <- "Mass (%)"
##D main <- "TG curves obtained from calcium oxalate"
##D plot(x = fqcdata, main = main, xlab=xlab, ylab=ylab,legend = TRUE)
## End(Not run)



