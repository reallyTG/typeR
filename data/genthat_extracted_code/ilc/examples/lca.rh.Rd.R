library(ilc)


### Name: lca.rh
### Title: A class of generalised Lee-Carter models
### Aliases: lca.rh
### Keywords: methods

### ** Examples

# standard LC model with Gaussian errors (corresponding to SVD graduation):
#   correct 0 or missing mortality rates before graduation
mod6g <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', max=110, interpolate=TRUE)
# AP LC model with Poisson errors
mod6p <- lca.rh(dd.cmi.pens, mod='lc', error='pois', interpolate=TRUE)
# Model Summary, Coefficients and Plotting:
mod6p; coef(mod6p); plot(mod6p)

# Comparison with standard fitting method
# Standard LC model (with Gaussian errors) - SVD fit (demography package)
modlc <- lca(dd.cmi.pens, interp=TRUE, adjust='none')
# Gaussian (SVD) - Gaussian (iterative)
round(modlc$ax-mod6g$ax, 4)
round(modlc$bx-mod6g$bx, 4)
round(modlc$kt-mod6g$kt, 4)
# -------------------------------------------------- #

# APC LC model fitted to restricted age range with 'deviance' residuals 
#  the remaining 0/NA values reestimated:
# WARNING: for proper fit recommend dec=6, but it can lead to slow convergence!
mod1 <- lca.rh(dd.cmi.pens, age=60:100, mod='m', interpolate=TRUE, res='dev', dec=1)



