library(ilc)


### Name: fle.plot
### Title: Miscellaneous plotting functions for 'lca' and 'lca.rh' type
###   regression objects. Plot of forecasted life expectancy based on a
###   fitted Lee-Carter model object
### Aliases: fle.plot
### Keywords: method

### ** Examples

mod6 <- lca.rh(dd.cmi.pens, mod='lc', interpolate=TRUE)
fle.plot(mod6, at=60, h=30, level=90)



