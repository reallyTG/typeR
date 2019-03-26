library(TAM)


### Name: WLErel
### Title: Reliability Estimation in 'TAM'
### Aliases: WLErel EAPrel

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example for reliability functions
#############################################################################

set.seed(9897)
N <- 100
# simulate theta and error SDs
x <- stats::rnorm(N,sd=2)
error <- stats::runif(N, .7, 1.3)
# compute WLE reliability
WLErel(x,error)
# compute EAP reliaility
EAPrel(x,error)



