library(car)


### Name: bcPower
### Title: Box-Cox, Box-Cox with Negatives Allowed, Yeo-Johnson and Basic
###   Power Transformations
### Aliases: bcPower bcnPower bcnPowerInverse yjPower basicPower
### Keywords: regression

### ** Examples

U <- c(NA, (-3:3))
## Not run: bcPower(U, 0)  # produces an error as U has negative values
bcPower(U, 0, gamma=4)
bcPower(U, .5, jacobian.adjusted=TRUE, gamma=4)
bcnPower(U, 0, gamma=2)
basicPower(U, lambda = 0, gamma=4)
yjPower(U, 0)
V <- matrix(1:10, ncol=2)
bcPower(V, c(0, 2))
basicPower(V, c(0,1))



