library(esaddle)


### Name: selectDecay
### Title: Tuning the Extended Empirical Saddlepoint (EES) density by
###   cross-validation
### Aliases: selectDecay

### ** Examples

library(esaddle)
# The data is far from normal: saddlepoint is needed and we expect 
# cross validation to be minimized at low "decay"
set.seed(4124)
selectDecay(decay = c(0.001, 0.01, 0.05, 0.1, 0.5, 1), 
            simulator = function(...) rgamma(500, 2, 1), 
            K = 5)
            
# The data is far from normal: saddlepoint is not needed and we expect 
#  the curve to be fairly flat for high "decay"
selectDecay(decay = c(0.001, 0.01, 0.05, 0.1, 0.5, 1), 
            simulator = function(...) rnorm(500, 0, 1), 
            K = 5)




