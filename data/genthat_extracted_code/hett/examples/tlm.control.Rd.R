library(hett)


### Name: tlm.control
### Title: Auxiliary for Controlling tlm Fitting
### Aliases: tlm.control
### Keywords: regression distribution

### ** Examples


data(mm, package = "hett")
attach(mm)

## change the maximum amount of iterations for the algorithm

fit1 <- tlm(m.marietta ~ CRSP, ~ 1, data = mm, start = list(dof = 3),
estDof = TRUE, control = tlm.control(maxit = 100))




