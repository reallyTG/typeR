library(flexsurv)


### Name: normboot.flexsurvreg
### Title: Simulate from the asymptotic normal distribution of parameter
###   estimates.
### Aliases: normboot.flexsurvreg
### Keywords: models

### ** Examples


    fite <- flexsurvreg(Surv(futime, fustat) ~ age, data = ovarian, dist="exp")
    normboot.flexsurvreg(fite, B=10, newdata=list(age=50))
    normboot.flexsurvreg(fite, B=10, X=matrix(50,nrow=1))
    normboot.flexsurvreg(fite, B=10, newdata=list(age=0))  ## closer to...
    fite$res



