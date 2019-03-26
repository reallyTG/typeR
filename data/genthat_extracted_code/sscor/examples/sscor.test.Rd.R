library(sscor)


### Name: sscor.test
### Title: Correlation test based on spatial signs
### Aliases: sscor.test

### ** Examples


set.seed(5)
require(mvtnorm)

# create bivariate shape matrix with correlation 0.5
sigma <- matrix(c(1,0.5,0.5,1),ncol=2)

# under normality, both tests behave similarly
data <- rmvnorm(100,c(0,0),sigma)
x <- data[,1]
y <- data[,2]

sscor.test(x,y)
cor.test(x,y)

# sscor.test also works at a Cauchy distribution
data <- rmvt(100,diag(1,2), df=1)
x <- data[,1]
y <- data[,2]

sscor.test(x,y)
cor.test(x,y)



