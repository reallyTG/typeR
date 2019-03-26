library(baseline)


### Name: plotBaseline
### Title: Plot method for "baseline" objects
### Aliases: plotBaseline plot,baseline-method
### Keywords: baseline plot

### ** Examples

data(milk)
bl <- baseline(milk$spectra[1,, drop=FALSE])
## Not run: 
##D   # Computationally intensive
##D   plot(bl)
##D   plot(bl, zoom = TRUE)
## End(Not run)



