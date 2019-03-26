library(MSwM)


### Name: msmFit
### Title: Fitting Markov Switching Models
### Aliases: msmFit msmFit-methods
###   msmFit,formula,numeric,logical,ANY,data.frame,ANY-method
###   msmFit,glm,numeric,logical,ANY,missing,ANY-method
###   msmFit,lm,numeric,logical,ANY,missing,missing-method

### ** Examples

## Not run
##	data(energy)
##	model=lm(Price~Oil+Gas+Coal+EurDol+Ibex35+Demand,energy)
##	mod=msmFit(model,k=2,sw=rep(TRUE,8))
##  summary(mod)
## End(Not run)


