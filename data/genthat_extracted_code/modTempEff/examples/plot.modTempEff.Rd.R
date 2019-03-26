library(modTempEff)


### Name: plot.modTempEff
### Title: Plot method for the class 'modTempEff'
### Aliases: plot.modTempEff
### Keywords: regression

### ** Examples

  ## Not run: 
##D   #obj is an object returned by tempeff()
##D   #plots DL curves for cold and heat with 95% pointwise CI
##D   # using frequentist standard errors
##D   plot(obj)
##D   
##D   #plots the estimated DL curve only for heat with 90% pointwise CI
##D   # using bayesian standard errors
##D   plot(obj, "heat", var.bayes=TRUE, level=.90)
##D   
## End(Not run)
  


