library(ProbitSpatial)


### Name: SpatialProbitFit
### Title: Fit a spatial probit model.
### Aliases: SpatialProbitFit

### ** Examples

n <- 1000
nneigh <- 3
rho <- 0.5
beta <- c(4,-2,1)
W <- generate_W(n,nneigh,seed=123)
X <- cbind(1,rnorm(n,2,2),rnorm(n,0,1))
colnames(X) <- c("intercept","X1","X2")
y <- sim_binomial_probit(W=W,X=X,beta=beta,rho=rho,model="SAR")
d <- as.data.frame(cbind(y,X))
mod <- SpatialProbitFit(y~X1+X2,d,W,
       DGP='SAR',method="conditional",varcov="varcov")




