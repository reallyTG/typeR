library(ilc)


### Name: matfle.plot
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects. Plot of forecasted life expectancy based on a
###   series of fitted Lee-Carter model objects
### Aliases: matfle.plot
### Keywords: plots

### ** Examples

rfp.cmi <- dd.rfp(dd.cmi.pens, c(0.5, 1.2, -0.7, 2.5))
mod6e <- elca.rh(rfp.cmi, age=50:100, interpolate=TRUE, dec=3)
# plot with original (fitted) base values
matfle.plot(mod6e$lca, label='RFP CMI')
# use a standard LC model fitting as base values
mod6 <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', interpolate=TRUE)
matfle.plot(mod6e$lca, mod6, label='RFP CMI')



