library(repeated)


### Name: kalcount
### Title: Repeated Measurements Models for Counts with Frailty or Serial
###   Dependence
### Aliases: kalcount deviance.kalcount residuals.kalcount fitted.kalcount
###   print.kalcount
### Keywords: models

### ** Examples


treat <- c(0,0,1,1)
tr <- tcctomat(treat)
dose <- # matrix(rpois(20,10),ncol=5)
	matrix(c(9,13,16,7,12,6,9,10,11,9,10,10,7,9,9,9,8,10,15,4),
		ncol=5,byrow=TRUE)
dd <- tvctomat(dose)
y <- # matrix(rpois(20,1+3*rep(treat,5)),ncol=5)
	restovec(matrix(c(1,1,1,1,0,1,0,1,0,5,3,3,4,1,4,4,2,3,2,5),
		ncol=5,byrow=TRUE))
reps <- rmna(y, ccov=tr, tvcov=dd)
#
# log normal intensity, independence model
kalcount(y, intensity="log normal", dep="independence", preg=1,
	pshape=0.1)
# random effect
kalcount(y, intensity="log normal", dep="frailty", pinitial=0.1,
	preg=1, psh=0.1)
# serial dependence
kalcount(y, intensity="log normal", dep="serial", pinitial=0.1,
	preg=1, pdep=0.01, psh=0.1)
# random effect and autoregression
kalcount(y, intensity="log normal", dep="frailty", pinitial=0.1,
	pdep=0.1, preg=1, psh=0.1)
# add time-constant variable
kalcount(y, intensity="log normal", pinitial=0.1, psh=0.1,
	preg=c(1,0), ccov=treat)
# or equivalently
kalcount(y, intensity="log normal", mu=~treat, pinitial=0.1,
	psh=0.1, preg=c(1,0))
# or
kalcount(y, intensity="log normal", mu=~b0+b1*treat,
	pinitial=0.1, psh=0.1, preg=c(1,0), envir=reps)
# add time-varying variable
kalcount(y, intensity="log normal", pinitial=0.1, psh=0.1,
	preg=c(1,0), ccov=treat, ptvc=0, tvc=dose)
# or equivalently, from the environment
dosev <- as.vector(t(dose))
kalcount(y, intensity="log normal", mu=~b0+b1*rep(treat,rep(5,4))+b2*dosev,
	pinitial=0.1, psh=0.1, ptvc=c(1,0,0))
# or from the reps data object
kalcount(y, intensity="log normal", mu=~b0+b1*treat+b2*dose,
	pinitial=0.1, psh=0.1, ptvc=c(1,0,0), envir=reps)
# try power variance family
kalcount(y, intensity="log normal", mu=~b0+b1*treat+b2*dose,
	pinitial=0.001, psh=14, ptvc=c(5,-1,0.1), envir=reps,
	pfamily=0.8)




