library(cubfits)


### Name: Print
### Title: Functions for Printing Objects According to Classes
### Aliases: print.mixnormerr
### Keywords: summary

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D 
##D ### Get individual of phi.Obs.
##D GM <- apply(yassour[, -1], 1, function(x) exp(mean(log(x[x != 0]))))
##D phi.Obs.all <- yassour[, -1] / sum(GM) * 15000
##D phi.Obs.all[phi.Obs.all == 0] <- NA
##D 
##D ### Run optimization.
##D X <- log(as.matrix(phi.Obs.all))
##D param.init <- list(K = 2, prop = c(0.95, 0.05), mu = c(-0.59, 3.11),
##D                    sigma2 = c(1.40, 0.59), sigma2.e = 0.03)
##D ret <- mixnormerr.optim(X, K = 2, param = param.init)
##D print(ret)
## End(Not run)



