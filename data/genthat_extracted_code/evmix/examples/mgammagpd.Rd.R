library(evmix)


### Name: mgammagpd
### Title: Mixture of Gammas Bulk and GPD Tail Extreme Value Mixture Model
### Aliases: mgammagpd dmgammagpd pmgammagpd qmgammagpd rmgammagpd
###   dmgammagpd mgammagpd pmgammagpd qmgammagpd rmgammagpd pmgammagpd
###   mgammagpd dmgammagpd qmgammagpd rmgammagpd qmgammagpd mgammagpd
###   dmgammagpd pmgammagpd rmgammagpd rmgammagpd mgammagpd dmgammagpd
###   pmgammagpd qmgammagpd

### ** Examples

## Not run: 
##D set.seed(1)
##D par(mfrow = c(1, 1))
##D 
##D x = rmgammagpd(1000, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2),
##D   u = 15, sigmau = 4, xi = 0)
##D xx = seq(-1, 40, 0.01)
##D hist(x, breaks = 100, freq = FALSE, xlim = c(-1, 40))
##D lines(xx, dmgammagpd(xx, mgshape = c(1, 6), mgscale = c(1, 2), mgweight = c(1, 2),
##D   u = 15, sigmau = 4, xi = 0))
##D abline(v = 15)
## End(Not run)




