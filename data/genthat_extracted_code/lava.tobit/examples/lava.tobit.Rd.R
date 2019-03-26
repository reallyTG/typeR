library(lava.tobit)


### Name: lava.tobit
### Title: Estimation and simulation of probit and tobit latent variable
###   models Framwork for estimating parameters and simulate data from
###   Latent Variable Models with binary and censored observations. Plugin
###   for the 'lava' package
### Aliases: lava.tobit lava.tobit-package lava.tobit-package
### Keywords: package

### ** Examples


library(lava.tobit)
m <- lvm(list(c(y,z) ~ x, y~z))
## Simulate 200 observation from path analysis model
## with all slopes and residual variances set to 1 and intercepts 0:
d <- sim(m,200,seed=1)
## Dichotomize y and introduce censoring on z
d <- transform(d, y=as.factor(y>0), z=Surv(z,z<2))
## No test: 
e <- estimate(m,d,control=list(trace=1),estimator="gaussian")
effects(e,y~x)
## End(No test)




