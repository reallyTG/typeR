library(Bolstad2)


### Name: pnullSamp
### Title: Test a one sided hypothesis using a sample from a posterior
###   density
### Aliases: pnullSamp

### ** Examples

## The posterior density is N(3,1)
theta <- rnorm(1000,3)

## test whether the true mean is greater than 0 (it is obviously!)
pnullSamp(theta)



