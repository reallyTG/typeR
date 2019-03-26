library(RandomFields)


### Name: RFcov
### Title: (Cross-)Covariance function
### Aliases: RFcov
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

n <- 1 ## use n <- 2 for better results

## isotropic model
model <- RMexp()
x <- seq(0, 10, 0.02)
z <- RFsimulate(model, x=x, n=n)
emp.vario <- RFcov(data=z)
plot(emp.vario, model=model)


## anisotropic model
model <- RMexp(Aniso=cbind(c(2,1), c(1,1)))
x <- seq(0, 10, 0.05)
z <- RFsimulate(model, x=x, y=x, n=n)
emp.vario <- RFcov(data=z, phi=4)
plot(emp.vario, model=model)


## space-time model
model <- RMnsst(phi=RMexp(), psi=RMfbm(alpha=1), delta=2)
x <- seq(0, 10, 0.05)
T <- c(0, 0.1, 100)
z <- RFsimulate(x=x, T=T, model=model, n=n)
emp.vario <- RFcov(data=z, deltaT=c(10, 1))
plot(emp.vario, model=model, nmax.T=3)


## multivariate model
model <- RMbiwm(nudiag=c(1, 2), nured=1, rhored=1, cdiag=c(1, 5), 
                s=c(1, 1, 2))
x <- seq(0, 20, 0.1)
z <- RFsimulate(model, x=x, y=x, n=n)
emp.vario <- RFcov(data=z)
plot(emp.vario, model=model)


## multivariate and anisotropic model
model <- RMbiwm(A=matrix(c(1,1,1,2), nc=2),
                nudiag=c(0.5,2), s=c(3, 1, 2), c=c(1, 0, 1))
x <- seq(0, 20, 0.1)
dta <- RFsimulate(model, x, x, n=n)
ev <- RFcov(data=dta, phi=4)
plot(ev, model=model, boundaries=FALSE)


## Don't show: ## Not run: 
##D ######################################################
##D # NOTE: distinguish the different uses of x and y
##D x <- c(1,2,1)
##D y <- c(4,5,6)
##D # coordinate space 1-dimensional, evaluated at 3 points:
##D RFcov(model=model, x=as.matrix(x), y=as.matrix(y))
##D # coordinate space is 3-dimensional, evaluated at a pair of points
##D RFcov(model=model, x=t(x), y=t(y))
## End(Not run)## End(Don't show)

## Don't show: 
FinalizeExample()
## End(Don't show)


