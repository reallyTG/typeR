library(spatialwarnings)


### Name: indicator_plrange
### Title: Power-law range indicator
### Aliases: indicator_plrange

### ** Examples

## Not run: 
##D forestgap.plr <- indicator_plrange(forestgap) 
##D do.call(rbind, forestgap.plr) # convert results to data.frame
##D 
##D # Restrict to small xmins 
##D forestgap.plr2 <- indicator_plrange(forestgap, xmin_bounds = c(1, 10)) 
##D do.call(rbind, forestgap.plr2) 
## End(Not run)



