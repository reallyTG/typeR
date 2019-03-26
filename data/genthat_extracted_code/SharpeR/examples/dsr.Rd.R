library(SharpeR)


### Name: dsr
### Title: The (non-central) Sharpe ratio.
### Aliases: dsr psr qsr rsr
### Keywords: distribution

### ** Examples

rvs <- rsr(128, 253*6, 0, 253)
dvs <- dsr(rvs, 253*6, 0, 253)
pvs.H0 <- psr(rvs, 253*6, 0, 253)
pvs.HA <- psr(rvs, 253*6, 1, 253)
## Not run: 
##D plot(ecdf(pvs.H0))
##D plot(ecdf(pvs.HA))
## End(Not run)




