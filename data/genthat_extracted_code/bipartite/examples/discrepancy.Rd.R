library(bipartite)


### Name: discrepancy
### Title: Calculates discrepancy of a matrix
### Aliases: discrepancy
### Keywords: package

### ** Examples

## Not run: 
##D #nulls <- replicate(100, discrepancy(commsimulator(Safariland, 
##D 		method="quasiswap")))
##D nulls <- simulate(vegan::nullmodel(Safariland, method="quasiswap"), nsim = 100)
##D null.res <- apply(nulls, 3, discrepancy)
##D hist(null.res)
##D obs <- discrepancy(Safariland)
##D abline(v=obs, lwd=3, col="grey")
##D c("p value"=min(sum(null.res>obs), sum(null.res<obs))/length(null.res))
##D # calculate Brualdi & Sanderson's Na-value (i.e. the z-score):
##D c("N_a"=(unname(obs)-mean(null.res))/sd(null.res))
## End(Not run)



