library(plsVarSel)


### Name: VIP
### Title: Filter methods for variable selection with Partial Least
###   Squares.
### Aliases: VIP SR sMC LW RC SR sMC LW RC

### ** Examples

data(gasoline, package = "pls")
library(pls)
pls  <- plsr(octane ~ NIR, ncomp = 10, validation = "LOO", data = gasoline)
comp <- which.min(pls$validation$PRESS)
X    <- gasoline$NIR
vip <- VIP(pls, comp)
sr  <- SR (pls, comp, X)
smc <- sMC(pls, comp, X)
lw  <- LW (pls, comp)
rc  <- RC (pls, comp)
matplot(scale(cbind(vip, sr, smc, lw, rc)), type = 'l')




