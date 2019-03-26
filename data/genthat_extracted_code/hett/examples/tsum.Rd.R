library(hett)


### Name: tsum
### Title: Summary function for the scale or location component of a
###   heteroscedastic t model
### Aliases: tsum print.tsum
### Keywords: regression distribution

### ** Examples


data(mm, package = "hett")
attach(mm)
tfit <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof = 3),
estDof = TRUE) 
tsum(tfit$loc.fit, dispersion = 1) 



