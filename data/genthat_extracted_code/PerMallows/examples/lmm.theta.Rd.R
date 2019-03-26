library(PerMallows)


### Name: lmm.theta
### Title: MLE for theta - Mallows Model
### Aliases: lmm.theta

### ** Examples

data <- matrix(c(1,2,3,4, 1,4,3,2, 1,2,4,3), nrow = 3, ncol = 4, byrow = TRUE)
lmm.theta(data, dist.name="kendall")
lmm.theta(data, dist.name="cayley")
lmm.theta(data, dist.name="cayley", sigma_0=c(1,4,3,2))
lmm.theta(data, dist.name="hamming")
lmm.theta(data, dist.name="ulam")



