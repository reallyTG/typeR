library(event)


### Name: ehr
### Title: Regression Models for Event History Intensity Functions
### Aliases: ehr print.intensity deviance.intensity vdm
### Keywords: models

### ** Examples

y <- c(5,3,2,4)
# event indicator
py <- pp(y)
# time since previous event
ptime <- tpast(y)
# individual ID
i <- c(1,1,2,2)
id <- ident(y, i)
# times and corresponding covariate values
tx <- c(2,3,1,2,2,2,2)
x <- c(1,2,2,1,2,2,1)
zcov <- tvcov(y, x, tx)
# Poisson process
ehr(py, plambda=1)
# Weibull process
lambda1 <- function(p) p[1]+p[2]*log(ptime)
ehr(py, lambda=lambda1, plambda=c(1,1))
# or
ehr(py, lambda=~log(ptime), plambda=c(1,1))
# or
ehr(py, lambda=~b0+b1*log(ptime), plambda=list(b0=1,b1=1))
# Poisson process with time-varying covariate
lambda2 <- function(p) p[1]+p[2]*zcov
ehr(py, lambda=lambda2, plambda=c(1,1))
# or
ehr(py, lambda=~zcov, plambda=c(1,1))
# or
ehr(py, lambda=~c0+c1*zcov, plambda=list(c0=1,c1=1))
# Weibull process with time-varying covariate
lambda3 <- function(p) p[1]+p[2]*log(ptime)+p[3]*zcov
ehr(py, lambda=lambda3, plambda=c(1,1,1))
# or
ehr(py, lambda=~log(ptime)+zcov, plambda=c(1,1,1))
# or
ehr(py, lambda=~c0+b1*log(ptime)+c1*zcov, plambda=list(c0=1,c1=1,b1=1))
# gamma process with time-varying covariate
lambda4 <- function(p) hgamma(ptime, p[1], exp(p[2]+p[3]*zcov))
ehr(py, lambda=lambda4, plambda=c(1,1,1))
# or
ehr(py, lambda=~hgamma(ptime, b1, exp(c0+c1*zcov)),
	plambda=list(c0=1,c1=1,b1=1))
# or
lambda5 <- function(p, linear) hgamma(ptime, p[1], exp(linear))
ehr(py, lambda=lambda5, linear=~zcov, plambda=c(1,1,1))



