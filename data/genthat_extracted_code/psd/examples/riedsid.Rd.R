library(psd)


### Name: riedsid
### Title: Constrained, optimal tapers using the Riedel & Sidorenko-Parker
###   method
### Aliases: riedsid riedsid.default riedsid.spec riedsid2 riedsid2.default
###   riedsid2.spec

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Riedel-Sidorenko-Parker taper optimization
##D ##
##D 
##D set.seed(1234)
##D # some params
##D nd <- 512 # num data
##D ntap <- 10 # num tapers
##D nrm <- 40 # sharpness of the peaks rel 2*variance
##D #
##D # create a pseudo spectrum
##D # with broad peaks
##D x <- 0:(nd-1)
##D riex <- rnorm(nd) + nrm*abs(cos(pi*x/180) + 1.2)
##D riex <- riex + 8*nrm*dcauchy(x, nd/3)
##D riex <- riex + 5*nrm*dnorm(x, nd/2)
##D # some flat regions
##D riex[riex<25] <- 25
##D ried <- dB(riex, invert=TRUE)
##D 
##D # optimize tapers
##D rtap <- riedsid(riex, ntaper=ntap)
##D rtap2 <- riedsid2(riex, ntaper=ntap)
##D 
##D # plot
##D op <- par(no.readonly = TRUE)
##D par(mfrow=c(2,1), mar=rep(1.3,4), mai=rep(0.6,4))
##D # ... the mock spectrum
##D plot(riex, type="h", xaxs="i", ylim=c(0,200), main='Pseudo-spectrum') 
##D # ... the optimal tapers
##D plot(rtap2, main='Optimal tapers') 
##D # original tapers:
##D lines(rtap, col="red")
##D par(op)
##D 
## End(Not run)#REX



