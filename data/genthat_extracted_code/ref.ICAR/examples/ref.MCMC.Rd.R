library(ref.ICAR)


### Name: ref.MCMC
### Title: MCMC for Reference Prior on an Intrinsic Conditional
###   Autoregressive Random Effects Model for Areal Data
### Aliases: ref.MCMC

### ** Examples

#### Fit the model for simulated areal data on a grid ####

### Load extra libraries
library(sp)
library(methods)
library(spdep)
library(mvtnorm)

### Generate areal data on a grid
rows=5; cols=5
tauc=1
sigma2=2; beta=c(1,5)

### Create grid
grid <- GridTopology(c(1,1), c(1,1), c(cols,rows))
polys <- as(grid, "SpatialPolygons")
spgrid <- SpatialPolygonsDataFrame(polys,data=data.frame(row.names=row.names(polys)))

### Create neighborhood matrix
grid.nb <- poly2nb(spgrid,queen=FALSE)
W <- nb2mat(grid.nb, style="B")

### Put spatially correlated data in grid
p <- length(beta)
num.reg <- (rows*cols)
if(p>1){x1<-rmvnorm(n=num.reg,mean=rep(0,p-1),sigma=diag(p-1))} else{x1<-NULL}
X <- cbind(rep(1,num.reg),x1)
Dmat <- diag(apply(W,1,sum))
H <- Dmat - W
row.names(H) <- NULL

### Obtain true response vector
theta_true <- rnorm(num.reg,mean=0,sd=sqrt(sigma2))
Q <- eigen(H,symmetric=TRUE)$vectors
eigH <- eigen(H,symmetric=TRUE)$values
D <- diag(eigH)
Qmat <- Q[,1:(num.reg-1)]
phimat <- diag(1/sqrt(eigH[1:(num.reg-1)]))
z <- t(rmvnorm(1,mean=rep(0,num.reg-1),sigma=diag(num.reg-1)))
phi_true <- sqrt((1/tauc)*sigma2)*(Qmat%*%phimat%*%z)
Y <- X%*%beta + theta_true + phi_true

### Fit the model
set.seed(5432)
## No test: 
model <- ref.MCMC(y=Y,X=X,H=H,iters=15000,burnin=5000,verbose=TRUE,tauc.start=.1,beta.start=-1,
sigma2.start=.1,step.tauc=0.5,
      step.sigma2=0.5)
      
## End(No test)

#### Small example for checking
model <- ref.MCMC(y=Y,X=X,H=H,iters=1000,burnin=50,verbose=TRUE,tauc.start=.1,beta.start=-1,
sigma2.start=.1,step.tauc=0.5,
      step.sigma2=0.5)



