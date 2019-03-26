library(lmomco)


### Name: parsla
### Title: Estimate the Parameters of the Slash Distribution
### Aliases: parsla
### Keywords: distribution (parameters) Distribution: Slash

### ** Examples

## Not run: 
##D par1 <- vec2par(c(-100, 30), type="sla")
##D X   <- rlmomco(500, par1)
##D lmr <- TLmoms(X, trim=1)
##D par2 <- parsla(lmr)
##D F <- seq(0.001,.999, by=0.001)
##D plot(qnorm(pp(X)), sort(X), pch=21, col=8,
##D      xlab="STANDARD NORMAL VARIATE",
##D      ylab="QUANTILE")
##D lines(qnorm(F), quasla(F, par1), lwd=3)
##D lines(qnorm(F), quasla(F, par2), col=2)
## End(Not run)



