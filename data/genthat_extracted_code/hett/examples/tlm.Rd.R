library(hett)


### Name: tlm
### Title: Maximum likelihood estimation for heteroscedastic t regression
### Aliases: tlm print.tlm
### Keywords: regression distribution

### ** Examples


data(mm, package = "hett")
attach(mm)

## fit a model with no heteroscedasticity and fixed degrees of freedom

tfit <- tlm(m.marietta ~ CRSP, data = mm, start = list(dof = 3))

## fit a model with heteroscedasticity and fixed degrees of freedom

tfit1 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof = 3))

## fit a model with heteroscedasticity and estimating the degrees of freedom

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm,
start = list(dof = 3), estDof = TRUE)



