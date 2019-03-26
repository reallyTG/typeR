library(pls)


### Name: biplot.mvr
### Title: Biplots of PLSR and PCR Models.
### Aliases: biplot.mvr
### Keywords: regression multivariate hplot

### ** Examples

data(oliveoil)
mod <- plsr(sensory ~ chemical, data = oliveoil)
## Not run: 
##D ## These are equivalent
##D biplot(mod)
##D plot(mod, plottype = "biplot")
##D 
##D ## The four combinations of x and y points:
##D par(mfrow = c(2,2))
##D biplot(mod, which = "x") # Default
##D biplot(mod, which = "y")
##D biplot(mod, which = "scores")
##D biplot(mod, which = "loadings")
## End(Not run)



