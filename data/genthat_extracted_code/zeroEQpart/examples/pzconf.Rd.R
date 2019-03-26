library(zeroEQpart)


### Name: pzconf
### Title: Calculate Confidence Intervals for the Difference of Zero Order
###   and (Semi) Partial Correlation
### Aliases: pzconf

### ** Examples

require(graphics)
require(MASS)
# data
set.seed(1111)
mu <- rep(0,4)
Sigma <- matrix(.2, nrow=4, ncol=4) + diag(4)*.8
data <- mvrnorm(n=100, mu=mu, Sigma=Sigma)

# p.(1,2) = p.(1,2)|(3,4) test
test <- pzcor(data[,1], data[,2], data[,c(3,4)], k = 1000)
hist(test$distribution)
pzconf(test, c(0.9, 0.95, 0.99))




