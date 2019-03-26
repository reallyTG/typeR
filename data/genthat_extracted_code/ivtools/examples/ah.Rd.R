library(ivtools)


### Name: ah
### Title: Fitting semiparametric additive hazards regression models.
### Aliases: ah

### ** Examples


require(ahaz)

##This example is adapted from the example given for the ahaz function 
##in the ahaz package 

data(sorlie)

# Break ties
set.seed(10101)
sorlie$time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Fit additive hazards model 
fit <- ah(formula=Surv(time, status)~X13+X14+X15+X16+X17+X18+X19+X20+X21+X22, 
  data=sorlie)
summary(fit)





