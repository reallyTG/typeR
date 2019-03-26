library(sdPrior)


### Name: get_theta_linear
### Title: Find Scale Parameter for Inverse Gamma Hyperprior of Linear
###   Effects with Spike and Slab Prior
### Aliases: get_theta_linear

### ** Examples

set.seed(123)
result <- get_theta_linear()
r <- result$r
v2 <- result$v2

get_theta_linear(alpha1=0.1,alpha2=0.1,c1=0.5,c2=0.1,v1=5) 




