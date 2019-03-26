library(edrGraphicalTools)


### Name: plot.edr
### Title: Basic plot of an edr object
### Aliases: plot.edr
### Keywords: regression

### ** Examples

## simulated example 
set.seed(10)
n <- 500
beta1 <- c(1,1,rep(0,8))
beta2 <- c(0,0,1,1,rep(0,6))
X <- rmvnorm(n,sigma=diag(1,10))
eps <- rnorm(n)
Y <- (X%*%beta1)**2+(X%*%beta2)**2+eps
edr2 <- edr(Y,X,H=2,K=2,method="SIR-II")
#plot(edr2)
## edr4 <- edr(Y,X,H=2,K=4,method="SIR-II")
## plot(edr4)





