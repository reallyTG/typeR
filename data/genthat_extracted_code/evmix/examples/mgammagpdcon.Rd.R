library(evmix)


### Name: mgammagpdcon
### Title: Mixture of Gammas Bulk and GPD Tail Extreme Value Mixture Model
###   with Single Continuity Constraint
### Aliases: mgammagpdcon dmgammagpdcon pmgammagpdcon qmgammagpdcon
###   rmgammagpdcon dmgammagpdcon mgammagpdcon pmgammagpdcon qmgammagpdcon
###   rmgammagpdcon pmgammagpdcon mgammagpdcon dmgammagpdcon qmgammagpdcon
###   rmgammagpdcon qmgammagpdcon mgammagpdcon dmgammagpdcon pmgammagpdcon
###   rmgammagpdcon rmgammagpdcon mgammagpdcon dmgammagpdcon pmgammagpdcon
###   qmgammagpdcon

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rmgammagpdcon(1000, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2), u = 15, xi = 0)
##D xx = seq(-1, 40, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, dmgammagpdcon(xx, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2),
##D  u = 15, xi = 0))
##D abline(v = 15)
## End(Not run)




