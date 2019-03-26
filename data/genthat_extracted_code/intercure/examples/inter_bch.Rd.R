library(intercure)


### Name: inter_bch
### Title: Fits promotion time cure rate model for interval censored data
### Aliases: inter_bch

### ** Examples

set.seed(3)
sample_set <- sim_bch(80)

## few iterations just to check how to use the function

inter_bch(sample_set, sample_set$L,
sample_set$R, c("xi1","xi2"), max_n = 5)

## precise estimate (computationally intensive)
## Not run: 
##D 
##D inter_bch(sample_set, sample_set$L, sample_set$R, c("xi1","xi2"))
## End(Not run)



