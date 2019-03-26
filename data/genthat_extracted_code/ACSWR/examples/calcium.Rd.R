library(ACSWR)


### Name: calcium
### Title: The Calcium in Soil
### Aliases: calcium
### Keywords: multivariate hypothesis testing

### ** Examples

data(calcium)
n <- nrow(calcium)
meanx <- colMeans(calcium[,-1])
varx <- var(calcium[,-1])
mu0 <- c(15,6,2.85)
t2 <- n*t(meanx-mu0)
t2



