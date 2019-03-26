library(intercure)


### Name: inter_frailty_cl
### Title: Cure rate frailty model for interval censored clustered data
### Aliases: inter_frailty_cl

### ** Examples

set.seed(3)
sample_set <- sim_frailty_cl(80, nclus = 3)

## few iterations just to check how to use the function

inter_frailty_cl(sample_set, sample_set$L, sample_set$R, sample_set$delta,
c("xi1"), c("xi1"), grp = sample_set$clus, M = 20,
max_n = 2, burn_in = 0)

## precise estimate (computationally intensive)
## Not run: 
##D 
##D inter_frailty_cl(sample_set, sample_set$L, sample_set$R, sample_set$delta,
##D c("xi1", "xi2"), c("xi1", "xi2"), grp = sample_set$clus, M = 20,
##D max_n = 30, burn_in = 10)
## End(Not run)



