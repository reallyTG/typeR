library(hett)


### Name: summary.tlm
### Title: summary method for class "tlm"
### Aliases: summary.tlm print.summary.tlm
### Keywords: regression distribution

### ** Examples


data(mm, package = "hett")
attach(mm)

## fit a model with heteroscedasticity and estimating the degrees of freedom

tfit2 <- tlm(m.marietta ~ CRSP, ~ CRSP, data = mm, start = list(dof =
3), estDof = TRUE)
summary(tfit2) 



