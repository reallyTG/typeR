library(ssmrob)


### Name: heckitrob
### Title: Robust Heckit Fit
### Aliases: heckitrob
### Keywords: Sample selection Robust estimator

### ** Examples

data(MEPS2001)
attach(MEPS2001)
selectEq <- dambexp ~ age+female+educ+blhisp+totchr+ins
outcomeEq <- lnambx ~ age+female+educ+blhisp+totchr+ins
summary(heckitrob(outcomeEq,selectEq,control=heckitrob.control(tcc=3.2,weights.x1="robCov")))



