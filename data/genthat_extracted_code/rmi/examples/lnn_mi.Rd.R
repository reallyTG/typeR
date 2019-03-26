library(rmi)


### Name: lnn_mi
### Title: Local Nearest Neighbor (LNN) MI Estimator
### Aliases: lnn_mi

### ** Examples

set.seed(123)
x <- rnorm(1000)
y <- x + rnorm(1000)
lnn_mi(cbind(x,y),c(1,1))




