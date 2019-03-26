library(sdPrior)


### Name: hyperparlin
### Title: Find Scale Parameter for Inverse Gamma Hyperprior of Linear
###   Effects with Spike and Slab Prior
### Aliases: hyperparlin

### ** Examples

set.seed(123)
result <- hyperparlin()
r <- result$r
b <- result$b

hyperparlin(alpha1=0.1,alpha2=0.1,c1=0.5,c2=0.1,a=5) 




