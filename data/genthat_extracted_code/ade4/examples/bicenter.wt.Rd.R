library(ade4)


### Name: bicenter.wt
### Title: Double Weighted Centring
### Aliases: bicenter.wt
### Keywords: utilities

### ** Examples

w <- matrix(1:6, 3, 2)
bicenter.wt(w, c(0.2,0.6,0.2), c(0.3,0.7))

w <- matrix(1:20, 5, 4)
sum(bicenter.wt(w, runif(5), runif(4))^2)



