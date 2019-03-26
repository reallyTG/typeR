library(ChainLadder)


### Name: BootChainLadder
### Title: Bootstrap-Chain-Ladder Model
### Aliases: BootChainLadder
### Keywords: models

### ** Examples

# See also the example in section 8 of England & Verrall (2002) on page 55.

B <- BootChainLadder(RAA, R=999, process.distr="gamma")
B
plot(B)
# Compare to MackChainLadder
MackChainLadder(RAA)
quantile(B, c(0.75,0.95,0.99, 0.995))

# fit a distribution to the IBNR
library(MASS)
plot(ecdf(B$IBNR.Totals))
# fit a log-normal distribution 
fit <- fitdistr(B$IBNR.Totals[B$IBNR.Totals>0], "lognormal")
fit
curve(plnorm(x,fit$estimate["meanlog"], fit$estimate["sdlog"]), col="red", add=TRUE)

# See also the ABC example in  Barnett and Zehnwirth (2007) 
A <- BootChainLadder(ABC, R=999, process.distr="gamma")
A
plot(A, log=TRUE)

## One year claims development result
CDR(A)




