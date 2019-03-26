library(rodeo)


### Name: plotStoichiometry
### Title: Plot Qualitative Stoichiometry Matrix
### Aliases: plotStoichiometry

### ** Examples

data(vars, pars, funs, pros, stoi)
model <- rodeo$new(vars, pars, funs, pros, stoi, dim=c(1))
model$setVars(c(bac=0.1, sub=0.5))
model$setPars(c(mu=0.8, half=0.1, yield= 0.1, vol=1000, flow=50, sub_in=1))
monod <- function(c,h) {c/(c+h)}
model$plotStoichiometry(box=c(1))



