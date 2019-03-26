library(edrGraphicalTools)


### Name: criterionRkh
### Title: Estimation of the Rkh criterion by bootstrap method
### Aliases: criterionRkh
### Keywords: regression

### ** Examples

## simulated example 1 
set.seed(10)
n <- 500
beta <- c(1,rep(0,9))
X <- rmvnorm(n,sigma=diag(10))
eps <- rnorm(n)
Y <- (X%*%beta)**3+eps*((X%*%beta)**2)
## Choice a grid of values for H
grid.H <- c(2,5,10,15,20,30)
res1 <- criterionRkh(Y,X,H=grid.H,B=50,method="SIR-I")
res1
#plot(res1,choice.H=c(2,5),choice.K=c(1,2))
## Estimation for SIR-II method with the same bootstrap replicate than for SIR-I
res2 <- criterionRkh(Y,X,H=grid.H,indices=res1$indices,B=50,method="SIR-II")
res2




