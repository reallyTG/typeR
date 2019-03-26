library(ilc)


### Name: matflc.plot
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects. Plot of forecasted Lee-Carter models based on a
###   series of fitted model objects
### Aliases: matflc.plot
### Keywords: plots

### ** Examples

rfp.cmi <- dd.rfp(dd.cmi.pens, c(0.5, 1.2, -0.7, 2.5))
mod6e <- elca.rh(rfp.cmi, age=50:70, interpolate=TRUE, dec=3)
# plot with original (fitted) base values
matflc.plot(mod6e$lca, label='RFP CMI')
# use a standard LC model fitting as base values
mod6 <- lca.rh(dd.cmi.pens, mod='lc', error='gauss', max.age = 70, interpolate=TRUE)
matflc.plot(mod6e$lca, mod6, label='RFP CMI')



