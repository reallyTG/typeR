library(growth)


### Name: elliptic
### Title: Nonlinear Multivariate Elliptically-contoured Repeated
###   Measurements Models with AR(1) and Two Levels of Variance Components
### Aliases: elliptic fitted.elliptic residuals.elliptic deviance.elliptic
###   print.elliptic
### Keywords: models

### ** Examples


# linear models
y <- matrix(rnorm(40),ncol=5)
x1 <- gl(2,4)
x2 <- gl(2,1,8)
# independence with time trend
elliptic(y, ccov=~x1, torder=2)
# AR(1)
elliptic(y, ccov=~x1, torder=2, par=0.1)
elliptic(y, ccov=~x1, torder=3, interact=3, par=0.1)
# random intercept
elliptic(y, ccov=~x1+x2, interact=c(2,0), torder=3, pre=2)
#
# nonlinear models
time <- rep(1:20,2)
dose <- c(rep(2,20),rep(5,20))
mu <- function(p) exp(p[1]-p[3])*(dose/(exp(p[1])-exp(p[2]))*
	(exp(-exp(p[2])*time)-exp(-exp(p[1])*time)))
shape <- function(p) exp(p[1]-p[2])*time*dose*exp(-exp(p[1])*time)
conc <- matrix(rnorm(40,mu(log(c(1,0.3,0.2))),sqrt(shape(log(c(0.1,0.4))))),
	ncol=20,byrow=TRUE)
conc[,2:20] <- conc[,2:20]+0.5*(conc[,1:19]-matrix(mu(log(c(1,0.3,0.2))),
	ncol=20,byrow=TRUE)[,1:19])
conc <- ifelse(conc>0,conc,0.01)
# with builtin function
# independence
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5))
# AR(1)
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5),
	par=0.1)
# add variance function
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5),
	par=0.1, varfn=shape, pvar=log(c(0.5,0.2)))
# multivariate power exponential distribution
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5),
	par=0.1, varfn=shape, pvar=log(c(0.5,0.2)), pell=1,
	distribution="power exponential")
# multivariate Student t distribution
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5),
	par=0.1, varfn=shape, pvar=log(c(0.5,0.2)), pell=5,
	distribution="Student t")
# multivariate Laplace distribution
elliptic(conc, model="pkpd", preg=log(c(0.5,0.4,0.1)), dose=c(2,5),
	par=0.1, varfn=shape, pvar=log(c(0.5,0.2)),
	distribution="Laplace")
# or equivalently with user-specified function
# independence
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)))
# AR(1)
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)), par=0.1)
# add variance function
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)), par=0.1,
	varfn=shape, pvar=log(c(0.5,0.2)))
# multivariate power exponential distribution
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)), par=0.1,
	varfn=shape, pvar=log(c(0.5,0.2)), pell=1,
	distribution="power exponential")
# multivariate Student t distribution
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)), par=0.1,
	varfn=shape, pvar=log(c(0.5,0.2)), pell=5,
	distribution="Student t")
# multivariate Laplace distribution
elliptic(conc, model=mu, preg=log(c(0.5,0.4,0.1)), par=0.1,
	varfn=shape, pvar=log(c(0.5,0.2)), pell=5,
	distribution="Laplace")
# or with user-specified formula
# independence
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),
	volume=log(0.1)))
# AR(1)
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	par=0.1)
# add variance function
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	varfn=~exp(b1-b2)*time*dose*exp(-exp(b1)*time),
	par=0.1, pvar=list(b1=log(0.5),b2=log(0.2)))
# variance as function of the mean
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	varfn=~d*log(mu),shfn=TRUE,par=0.1, pvar=list(d=1))
# multivariate power exponential distribution
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	varfn=~exp(b1-b2)*time*dose*exp(-exp(b1)*time),
	par=0.1, pvar=list(b1=log(0.5),b2=log(0.2)), pell=1,
	distribution="power exponential")
# multivariate Student t distribution
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	varfn=~exp(b1-b2)*time*dose*exp(-exp(b1)*time),
	par=0.1, pvar=list(b1=log(0.5),b2=log(0.2)), pell=5,
	distribution="Student t")
# multivariate Laplace distribution
elliptic(conc, model=~exp(absorption-volume)*
	dose/(exp(absorption)-exp(elimination))*
	(exp(-exp(elimination)*time)-exp(-exp(absorption)*time)),
	preg=list(absorption=log(0.5),elimination=log(0.4),volume=log(0.1)),
	varfn=~exp(b1-b2)*time*dose*exp(-exp(b1)*time),
	par=0.1, pvar=list(b1=log(0.5),b2=log(0.2)), pell=5,
	distribution="Laplace")
#
# generalized logistic regression with square-root transformation
# and square  link
time <- rep(seq(10,200,by=10),2)
mu <- function(p) {
	yinf <- exp(p[2])
	yinf*(1+((yinf/exp(p[1]))^p[4]-1)*exp(-yinf^p[4]
		*exp(p[3])*time))^(-1/p[4])}
y <- matrix(rnorm(40,sqrt(mu(c(2,1.5,0.05,-2))),0.05)^2,ncol=20,byrow=TRUE)
y[,2:20] <- y[,2:20]+0.5*(y[,1:19]-matrix(mu(c(2,1.5,0.05,-2)),
	ncol=20,byrow=TRUE)[,1:19])
y <- ifelse(y>0,y,0.01)
# with builtin function
# independence
elliptic(y, model="logistic", preg=c(2,1,0.1,-1), trans="sqrt",
	link="square")
# the same model with AR(1)
elliptic(y, model="logistic", preg=c(2,1,0.1,-1), trans="sqrt",
	link="square", par=0.4)
# the same model with AR(1) and one component of variance
elliptic(y, model="logistic", preg=c(2,1,0.1,-1),
	trans="sqrt", link="square", pre=1, par=0.4)
# or equivalently with user-specified function
# independence
elliptic(y, model=mu, preg=c(2,1,0.1,-1), trans="sqrt",
	link="square")
# the same model with AR(1)
elliptic(y, model=mu, preg=c(2,1,0.1,-1), trans="sqrt",
	link="square", par=0.4)
# the same model with AR(1) and one component of variance
elliptic(y, model=mu, preg=c(2,1,0.1,-1),
	trans="sqrt", link="square", pre=1, par=0.4)
# or equivalently with user-specified formula
# independence
elliptic(y, model=~exp(yinf)*(1+((exp(yinf-y0))^b4-1)*
	exp(-exp(yinf*b4+b3)*time))^(-1/b4),
	preg=list(y0=2,yinf=1,b3=0.1,b4=-1), trans="sqrt", link="square")
# the same model with AR(1)
elliptic(y, model=~exp(yinf)*(1+((exp(yinf-y0))^b4-1)*
	exp(-exp(yinf*b4+b3)*time))^(-1/b4),
	preg=list(y0=2,yinf=1,b3=0.1,b4=-1), trans="sqrt",
	link="square", par=0.1)
# add one component of variance
elliptic(y, model=~exp(yinf)*(1+((exp(yinf-y0))^b4-1)*
	exp(-exp(yinf*b4+b3)*time))^(-1/b4),
	preg=list(y0=2,yinf=1,b3=0.1,b4=-1),
	trans="sqrt", link="square", pre=1, par=0.1)
#
# multivariate power exponential and Student t distributions for outliers
y <- matrix(rcauchy(40,mu(c(2,1.5,0.05,-2)),0.05),ncol=20,byrow=TRUE)
y[,2:20] <- y[,2:20]+0.5*(y[,1:19]-matrix(mu(c(2,1.5,0.05,-2)),
	ncol=20,byrow=TRUE)[,1:19])
y <- ifelse(y>0,y,0.01)
# first with normal distribution
elliptic(y, model="logistic", preg=c(1,1,0.1,-1))
elliptic(y, model="logistic", preg=c(1,1,0.1,-1), par=0.5)
# then power exponential
elliptic(y, model="logistic", preg=c(1,1,0.1,-1), pell=1,
	distribution="power exponential")
elliptic(y, model="logistic", preg=c(1,1,0.1,-1), par=0.5, pell=1,
	distribution="power exponential")
# finally Student t
elliptic(y, model="logistic", preg=c(1,1,0.1,-1), pell=1,
	distribution="Student t")
elliptic(y, model="logistic", preg=c(1,1,0.1,-1), par=0.5, pell=1,
	distribution="Student t")




