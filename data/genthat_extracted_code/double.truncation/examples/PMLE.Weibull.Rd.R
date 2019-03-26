library(double.truncation)


### Name: PMLE.Weibull
### Title: Parametric Inference for the Weibull model
### Aliases: PMLE.Weibull
### Keywords: Location-scale family Weibull distribution

### ** Examples

## A data example from Efron and Petrosian (1999) ## 
y.trunc=c(0.75, 1.25, 1.50, 1.05, 2.40, 2.50, 2.25)
u.trunc=c(0.4, 0.8, 0.0, 0.3, 1.1, 2.3, 1.3)
v.trunc=c(2.0, 1.8, 2.3, 1.4, 3.0, 3.4, 2.6)
PMLE.Weibull(u.trunc,y.trunc,v.trunc)



