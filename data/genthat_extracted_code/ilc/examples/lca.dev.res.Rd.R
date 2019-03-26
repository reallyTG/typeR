library(ilc)


### Name: lca.dev.res
### Title: Miscellaneous utility functions for 'lca' and 'lca.rh' type
###   regression objects. Deviance residuals of the Lee-Carter model
### Aliases: lca.dev.res
### Keywords: method

### ** Examples

# original model object with 'logrates' residuals
mod6 <- lca.rh(dd.cmi.pens, mod="lc", error="gauss", max=110, interpolate=TRUE)
# adjusted model object with 'deviance' residuals: 
dev6 <- lca.dev.res(mod6, insp.dd(dd.cmi.pens, "pop"))



