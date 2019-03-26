library(poppr)


### Name: mll.reset
### Title: Reset multilocus lineages
### Aliases: mll.reset mll.reset,genclone-method mll.reset,snpclone-method

### ** Examples


# This data set was a subset of a larger data set, so the multilocus
# genotypes are not all sequential
data(Pinf)
mll(Pinf) <- "original"
mll(Pinf)

# If we use mll.reset, then it will become sequential
Pinf.new <- mll.reset(Pinf, TRUE) # reset all
mll(Pinf.new)

## Not run: 
##D 
##D # It is possible to reset only specific mll definitions. For example, let's
##D # say that we wanted to filter our multilocus genotypes by nei's distance
##D mlg.filter(Pinf, dist = nei.dist, missing = "mean") <- 0.02
##D 
##D # And we wanted to set those as custom genotypes,
##D mll.custom(Pinf) <- mll(Pinf, "contracted")
##D mll.levels(Pinf) <- .genlab("MLG", nmll(Pinf, "custom"))
##D 
##D # We could reset just the original and the filtered if we wanted to and keep
##D # the custom as it were.
##D 
##D Pinf.new <- mll.reset(Pinf, c("original", "contracted"))
##D 
##D mll(Pinf.new, "original")
##D mll(Pinf.new, "contracted")
##D mll(Pinf.new, "custom")
##D 
##D # If "original" is not one of the values, then that is used as a baseline.
##D Pinf.orig <- mll.reset(Pinf, "contracted")
##D mll(Pinf.orig, "contracted")
##D mll(Pinf.new, "contracted")
## End(Not run)




