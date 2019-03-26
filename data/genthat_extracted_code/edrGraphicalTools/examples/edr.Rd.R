library(edrGraphicalTools)


### Name: edr
### Title: Main function for estimation of the EDR space
### Aliases: edr
### Keywords: regression

### ** Examples

set.seed(10)
n <- 500
beta1 <- c(1,1,rep(0,8))
beta2 <- c(0,0,1,1,rep(0,6))
X <- rmvnorm(n,sigma=diag(1,10))
eps <- rnorm(n)
Y <- (X%*%beta1)**2+(X%*%beta2)**2+eps

## Estimation of the trace square criterion 
## grid.H <- c(2,5,10,15,20,30)
## res2 <- criterionRkh(Y,X,H=grid.H,B=50,method="SIR-II")
## summary(res2)
## plot(res2)

## Estimation of the EDR direction for K=2 and H=2 and SIR-II method
edr2 <- edr(Y,X,H=2,K=2,method="SIR-II")
summary(edr2)
#plot(edr2)



