library(WRTDStidal)


### Name: wrtds
### Title: Get WRTDS prediction grid
### Aliases: wrtds wrtds.tidal wrtds.tidalmean

### ** Examples

## Not run: 
##D ## load data
##D data(chldat)
##D 
##D ## as tidal object
##D dat_in <- tidal(chldat)
##D res <- wrtds(dat_in)
##D 
##D ## as tidalmean object
##D dat_in <- tidalmean(chldat)
##D res <- wrtds(dat_in)
##D 
##D ## multiple quantiles
##D res <- wrtds(dat_in, tau = c(0.1, 0.5, 0.9))
## End(Not run)



