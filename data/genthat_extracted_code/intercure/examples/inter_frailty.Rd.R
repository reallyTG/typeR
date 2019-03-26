library(intercure)


### Name: inter_frailty
### Title: Fits cure rate frailty model for interval censored data
### Aliases: inter_frailty

### ** Examples

## few iterations just to check how to use the function
set.seed(3)
sample_set <- sim_frailty(80)

inter_frailty(sample_set, sample_set$L, sample_set$R, sample_set$delta,
c("xi1","xi2"), c("xi1","xi2"), M = 10, max_n = 3, burn_in = 0)

## precise estimate (computationally intensive)
## Not run: 
##D 
##D inter_frailty(sample_set, sample_set$L, sample_set$R, sample_set$delta,
##D c("xi1"), c("xi2"), M = 50, max_n = 50, burn_in = 10)
## End(Not run)



