library(pls)


### Name: validationplot
### Title: Validation Plots
### Aliases: validationplot plot.mvrVal
### Keywords: regression multivariate hplot

### ** Examples

data(oliveoil)
mod <- plsr(sensory ~ chemical, data = oliveoil, validation = "LOO")
## Not run: 
##D ## These three are equivalent:
##D validationplot(mod, estimate = "all")
##D plot(mod, "validation", estimate = "all")
##D plot(RMSEP(mod, estimate = "all"))
##D ## Plot R2:
##D plot(mod, "validation", val.type = "R2")
##D ## Plot R2, with a legend:
##D plot(mod, "validation", val.type = "MSEP", legendpos = "top") # R >= 2.1.0
## End(Not run)



