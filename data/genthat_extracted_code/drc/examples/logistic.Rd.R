library(drc)


### Name: logistic
### Title: The logistic model
### Aliases: logistic L.3 L.4 L.5
### Keywords: models nonlinear

### ** Examples


## Fitting the four-parameter logistic model
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = L.4())
summary(ryegrass.m1)

## Fitting an asymmetric logistic model
##  requires installing the package 'NISTnls'
# Ratkowsky3.m1 <- drm(y~x, data = Ratkowsky3, 
# fct = L.5(fixed = c(NA, 0, NA, NA, NA)))
# plot(Ratkowsky3.m1)
# summary(Ratkowsky3.m1)  
## okay agreement with NIST values
##  for the two parameters that are the same




