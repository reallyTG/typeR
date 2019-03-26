library(nlstools)


### Name: confint2
### Title: Confidence intervals in nonlinear regression
### Aliases: confint2
### Keywords: models nonlinear

### ** Examples


L.minor.m1 <- nls(rate ~ Vm*conc/(K+conc), data = L.minor, start = list(K=20, Vm=120))

confint2(L.minor.m1)

confint2(L.minor.m1, "K")




