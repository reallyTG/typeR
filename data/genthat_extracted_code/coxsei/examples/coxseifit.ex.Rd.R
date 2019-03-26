library(coxsei)


### Name: coxseifit.ex
### Title: CoxSEI model with exponential function
### Aliases: coxseifit.ex
### Keywords: regression survival

### ** Examples

data("dat")
csfit <- coxseifit.ex(dat,c(1:3*0.2,0.7,10))
coef(csfit)
plot(csfit$cintfn,do.points=FALSE)



