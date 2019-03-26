library(pls)


### Name: plot.mvr
### Title: Plot Method for MVR objects
### Aliases: plot.mvr
### Keywords: regression multivariate hplot

### ** Examples

data(yarn)
nir.pcr <- pcr(density ~ NIR, ncomp = 9, data = yarn, validation = "CV")
## Not run: 
##D plot(nir.pcr, ncomp = 5) # Plot of cross-validated predictions
##D plot(nir.pcr, "scores") # Score plot
##D plot(nir.pcr, "loadings", comps = 1:3) # The three first loadings
##D plot(nir.pcr, "coef", ncomp = 5) # Coefficients
##D plot(nir.pcr, "val") # RMSEP curves
##D plot(nir.pcr, "val", val.type = "MSEP", estimate = "CV") # CV MSEP
## End(Not run)



