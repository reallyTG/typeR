library(pls)


### Name: predplot
### Title: Prediction Plots
### Aliases: predplot predplot.default predplot.mvr predplotXy
### Keywords: regression multivariate hplot

### ** Examples

data(yarn)
mod <- plsr(density ~ NIR, ncomp = 10, data = yarn[yarn$train,], validation = "CV")
## Not run: 
##D predplot(mod, ncomp = 1:6)
##D plot(mod, ncomp = 1:6) # Equivalent to the previous
##D ## Both cross-validated and test set predictions:
##D predplot(mod, ncomp = 4:6, which = c("validation", "test"),
##D          newdata = yarn[!yarn$train,])
## End(Not run)

data(oliveoil)
mod.sens <- plsr(sensory ~ chemical, ncomp = 4, data = oliveoil)
## Not run: plot(mod.sens, ncomp = 2:4) # Several responses gives several plots



