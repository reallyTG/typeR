library(extRemes)


### Name: erlevd
### Title: Effective Return Levels
### Aliases: erlevd
### Keywords: distribution models

### ** Examples


data(PORTw)

fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
fit
tmp <- erlevd(fit, period=20)

## Not run: 
##D # Currently, the ci function does not work for effective
##D # return levels.  There were coding issues encountered.
##D # But, could try:
##D #
##D z <- rextRemes(fit, n=500)
##D dim(z)
##D # 500 randomly drawn samples from the
##D # fitted model.  Each row is a sample
##D # of data from the fitted model of the
##D # same length as the data.  Each column
##D # is a separate sample.
##D 
##D sam <- numeric(0)
##D for( i in 1:500) {
##D     cat(i, " ")
##D     dat <- data.frame(z=z[,i], AOindex=PORTw$AOindex)
##D     res <- fevd(z, dat, location.fun=~AOindex)
##D     sam <- cbind(sam, c(erlevd(res)))
##D }
##D cat("\n")
##D 
##D dim(sam)
##D 
##D a <- 0.05
##D res <- apply(sam, 1, quantile, probs=c(a/2, 1 - a/2))
##D nm <- rownames(res)
##D 
##D res <- cbind(res[1,], tmp, res[2,])
##D colnames(res) <- c(nm[1], "Estimated 20-year eff. ret. level", nm[2])
##D res
##D 
## End(Not run)



