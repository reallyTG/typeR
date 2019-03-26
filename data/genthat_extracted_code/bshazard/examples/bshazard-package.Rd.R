library(bshazard)


### Name: bshazard-package
### Title: Nonparametric Smoothing of the Hazard Function
### Aliases: bshazard-package
### Keywords: survival nonparametric smooth

### ** Examples

data(lung,package="survival")
  fit<-bshazard(Surv(time, status==2) ~ 1,data=lung)
  plot(fit)



