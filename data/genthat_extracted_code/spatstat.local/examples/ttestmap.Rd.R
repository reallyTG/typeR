library(spatstat.local)


### Name: ttestmap
### Title: Test of Effect in Locally Fitted Point Process Model
### Aliases: ttestmap
### Keywords: spatial htest

### ** Examples

 fit <- with(copper,
        locppm(Points, ~D, covariates=list(D=distfun(Lines)), nd=c(7,15)))
 plot(ttestmap(fit, "D"))



