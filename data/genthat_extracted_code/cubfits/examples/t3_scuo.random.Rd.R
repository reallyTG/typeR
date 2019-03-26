library(cubfits)


### Name: Randomize SCUO Index
### Title: Generate Randomized SCUO Index
### Aliases: scuo.random
### Keywords: tool

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D 
##D ### example dataset.
##D y.scuo <- convert.y.to.scuo(ex.train$y)
##D SCUO <- calc_scuo_values(y.scuo)$SCUO
##D plotprxy(ex.train$phi.Obs, SCUO)
##D 
##D ### yassour dataset.
##D GM <- apply(yassour[, -1], 1, function(x) exp(mean(log(x[x != 0]))))
##D phi.Obs <- GM / sum(GM) * 15000
##D mean(log(phi.Obs))
##D sd(log(phi.Obs))
##D ret <- scuo.random(SCUO, meanlog = -0.441473, sdlog = 1.393285)
##D plotprxy(ret, SCUO)
## End(Not run)



