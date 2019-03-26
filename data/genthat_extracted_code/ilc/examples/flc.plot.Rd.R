library(ilc)


### Name: flc.plot
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects. Plot of forecasted Lee-Carter model based on a
###   fitted model object
### Aliases: flc.plot
### Keywords: method

### ** Examples

mod6 <- lca.rh(dd.cmi.pens, mod='lc', interpolate=TRUE)
flc.plot(mod6, at=60, h=30, level=90)



