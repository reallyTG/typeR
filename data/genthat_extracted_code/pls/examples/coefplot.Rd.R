library(pls)


### Name: coefplot
### Title: Plot Regression Coefficients of PLSR and PCR models
### Aliases: coefplot
### Keywords: regression multivariate hplot

### ** Examples

data(yarn)
mod.nir <- plsr(density ~ NIR, ncomp = 8, data = yarn)
## Not run: 
##D coefplot(mod.nir, ncomp = 1:6)
##D plot(mod.nir, plottype = "coefficients", ncomp = 1:6) # Equivalent to the previous
##D ## Plot with legend:
##D coefplot(mod.nir, ncom = 1:6, legendpos = "bottomright")
## End(Not run)

data(oliveoil)
mod.sens <- plsr(sensory ~ chemical, ncomp = 4, data = oliveoil)
## Not run: coefplot(mod.sens, ncomp = 2:4, separate = TRUE)



