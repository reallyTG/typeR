library(supportInt)


### Name: supportInt-package
### Title: Calculates Likelihood Support Intervals for Common Data Types
### Aliases: supportInt-package supportInt
### Keywords: Support Intervals

### ** Examples

#Binomial data 
binLikSI(4, 10, 8)

#Poisson data returning the estimated confidence level
poisLikSI(4, 8, conf=TRUE)

#GLM coefficients
set.seed(10)
x <- rnorm(50, 0 , 5)
expit <- function(z) exp(z)/(1+exp(z))
p <- expit(.1+ .4*x)
y <- sapply(1:length(p), function(z) rbinom(1,1, p[z]))
glm.obj <- glm(y~x, family="binomial")
glmLikSI(glm.obj, 8)




