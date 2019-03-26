library(logbin)


### Name: logbin.control
### Title: Auxiliary for Controlling logbin Fitting
### Aliases: logbin.control
### Keywords: optimize models

### ** Examples

## Variation on example(glm.control) :

evts <- c(18,17,15,20,10,20,25,13,12)
obs <- rep(30,9)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
oo <- options(digits = 12)
logbin.D93X <- logbin(cbind(evts,obs-evts) ~ outcome + treatment, trace = 2, epsilon = 1e-2)
options(oo)
coef(logbin.D93X)



