library(event)


### Name: kalsurv
### Title: Repeated Events Models with Frailty or Serial Dependence
### Aliases: kalsurv deviance.kalsurv fitted.kalsurv print.kalsurv
###   residuals.kalsurv
### Keywords: models

### ** Examples

treat <- c(0,0,1,1)
tr <- tcctomat(treat)
cens <- matrix(rbinom(20,1,0.9),ncol=5)
times <- # matrix(rweibull(20,2,1+3*rep(treat,5)),ncol=5)
	matrix(c(1.36,0.18,0.84,0.65,1.44,1.79,1.04,0.43,1.35,1.63,2.15,1.15,
		1.21,5.46,1.58,3.44,4.40,2.75,4.78,2.44),ncol=5,byrow=TRUE)
times <- restovec(times, censor=cens)
reps <- rmna(times, ccov=tr)
# exponential intensity model with independence
kalsurv(times, pinitial=0.5, preg=1, dep="independence",
	intensity="exponential")
# Weibull intensity model with independence
kalsurv(times, pinitial=0.5, preg=1, pshape=1, dep="independence",
	intensity="Weibull")
# same model with serial update
kalsurv(times, pinitial=0.5, pdep=0.1, preg=1, pshape=1, dep="serial",
	intensity="Weibull")
# try power variance family instead of gamma distribution for mixture
kalsurv(times, pinitial=0.5, pdep=0.1, preg=1, pshape=1, dep="serial",
	intensity="Weibull", pfamily=0.1)
# treatment effect with log link
kalsurv(times, pinitial=0.5, preg=c(1,0), pshape=1, intensity="Weibull",
	ccov=treat)
# or equivalently
kalsurv(times, mu=~exp(a+b*treat), pinitial=0.1, preg=c(1,0), pshape=1,
	intensity="Weibull", envir=reps)
# with identity link instead
kalsurv(times, mu=~treat, pinitial=0.5, preg=c(1,0), pshape=1,
	intensity="Weibull")
# or equivalently
kalsurv(times, mu=~a+b*treat, pinitial=0.5, preg=c(1,0), pshape=1,
	intensity="Weibull", envir=reps)
# add the birth model
kalsurv(times, pinitial=0.5, preg=c(1,0), pshape=1,
	intensity="Weibull", ccov=treat, pbirth=0)
# try frailty dependence
kalsurv(times, pinitial=0.5, preg=c(1,0), pshape=1, dep="frailty",
	intensity="Weibull", ccov=treat)
# add autoregression
kalsurv(times, pinitial=0.5, preg=c(1,0), pshape=1, dep="frailty",
	pdep=0.1, intensity="Weibull", ccov=treat)
# switch to gamma intensity model
kalsurv(times, pinitial=0.5, preg=c(1,0), pshape=1, intensity="gamma",
	ccov=treat)



