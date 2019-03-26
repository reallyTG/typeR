library(rodeo)


### Name: rodeo-class
### Title: 'rodeo' Class
### Aliases: rodeo-class rodeo
### Keywords: datasets

### ** Examples

# Bacteria growth in a continuous flow culture
library("deSolve")

# Creation of model object
data(vars, pars, funs, pros, stoi)
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(1))

# Parameters, initial values
model$setPars(c(mu=0.8, half=0.1, yield= 0.1, vol=1000, flow=50, sub_in=1))
model$setVars(c(bac=0.01, sub=0))

# Implementation of functions declared in 'funs'
monod <- function(c,h) {c/(c+h)}

# Creation of derivatives function
code <- model$generate(name="derivs", lang="r")
derivs <- eval(parse(text=code))

# Integration
times <- 0:96
out <- deSolve::ode(y=model$getVars(), times=times, func=derivs,
  parms=model$getPars())
colnames(out) <- c("time", model$namesVars(), model$namesPros())
plot(out)



