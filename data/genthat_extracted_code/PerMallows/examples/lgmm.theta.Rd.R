library(PerMallows)


### Name: lgmm.theta
### Title: MLE for theta - Generalized Mallows Model
### Aliases: lgmm.theta

### ** Examples

data <- matrix(c(1,2,3,4, 1,4,3,2, 1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
lgmm.theta(data, dist.name="kendall")
lgmm.theta(data, dist.name="cayley")
lgmm.theta(data, dist.name="cayley", sigma_0=c(1,4,3,2))
lgmm.theta(data, dist.name="hamming")



