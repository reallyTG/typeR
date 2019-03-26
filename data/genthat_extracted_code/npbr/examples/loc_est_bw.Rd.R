library(npbr)


### Name: loc_est_bw
### Title: Bandwidth selection for the local linear frontier estimator
### Aliases: loc_est_bw
### Keywords: optimize

### ** Examples

## Not run: 
##D data("nuclear")
##D x.nucl <- seq(min(nuclear$xtab), max(nuclear$xtab), 
##D  length.out = 101) 
##D # 1. Unconstrained case 
##D # Optimal bandwidths over 100 bootstrap replications
##D system.time(
##D h.nucl.u <- loc_est_bw(nuclear$xtab, nuclear$ytab, 
##D  x.nucl, hini = 40, B = 1, method = "u")
##D )
##D # result is 79.11877
##D 
##D # 2. Monotonicity constraint
##D # Optimal bandwidths over 100 bootstrap replications
##D h.nucl.m <- loc_est_bw(nuclear$xtab, nuclear$ytab, 
##D  x.nucl, hini = 40, B = 100, method = "m") 
##D # result is 79.12
## End(Not run)



