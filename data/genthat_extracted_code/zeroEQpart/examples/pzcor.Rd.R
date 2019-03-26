library(zeroEQpart)


### Name: pzcor
### Title: Test for Equal Zero Order and (Semi) Partial Correlation
### Aliases: pzcor

### ** Examples

require(graphics)
require(MASS)
# data
set.seed(1111)
mu <- rep(0,4)
Sigma <- matrix(.2, nrow=4, ncol=4) + diag(4)*.8
data <- mvrnorm(n=100, mu=mu, Sigma=Sigma)

# p.(1,2) = p.(1,2)|(3,4) test
test <- pzcor(data[,1], data[,2], data[,c(3,4)], k = 1000, semi = FALSE,
              test = 'eq')
hist(test$distribution)
test



