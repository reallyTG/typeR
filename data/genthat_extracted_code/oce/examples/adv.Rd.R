library(oce)


### Name: adv
### Title: ADV (acoustic-doppler velocimeter) dataset
### Aliases: adv

### ** Examples

## Not run: 
##D library(oce)
##D data(adv)
##D 
##D # Velocity time-series
##D plot(adv)
##D 
##D # Spectrum of upward component of velocity, with ``turbulent'' reference line
##D s <- spectrum(adv[["v"]][,3],plot=FALSE)
##D plot(log10(s$freq), log10(s$spec), type='l')
##D for (a in seq(-20, 20, by=1))
##D     abline(a=a, b=-5/3, col='gray', lty='dotted')
## End(Not run)




