library(ecespa)


### Name: figuras
### Title: Artificial point data.
### Aliases: fig1 fig2 fig3 figuras
### Keywords: datasets

### ** Examples

## Not run: 
##D data(fig1)
##D 
##D data(fig2)
##D 
##D data(fig3)
##D 
##D # transform to ppp format of spatstat with function haz.ppp:
##D 
##D fig1.ppp <- haz.ppp(fig1)
##D 
##D fig2.ppp <- haz.ppp(fig2)
##D 
##D fig3.ppp <- haz.ppp(fig3)
##D 
##D #Analyses as in Fig.3.2 of De la Cruz (2008). First, compute function K:
##D 
##D cosa1 <- Kest(fig1.ppp)
##D 
##D # Plot different estimators. 
##D # Fig. 3.2a: 
##D 
##D par("mar"=par("mar")+c(0,1,0,0))
##D 
##D plot(cosa1, col=c(1,0,0,1), lwd=c(2,2,2,2), lty=c(1,1,1,2), 
##D 	 main="")
##D 
##D # Fig. 3.2b:
##D 
##D plot(cosa1, sqrt(./pi)-r~r, col=c(1,0,0,1), lwd=c(2,2,2,2), 
##D          lty=c(1,1,1,2), main="", ylab="L(r)")
##D 
##D # Fig. 3.2c:
##D 
##D plot(cosa1, .-(pi*r^2)~r, col=c(1,0,0,1), lwd=c(2,2,2,2), 
##D          lty=c(1,1,1,2), main="", ylab=expression(K(r)-pi*r^2))
##D 
##D # Fig. 3.2d:
##D 
##D plot(cosa1,(./(pi*r^2))-1~r, col=c(1,0,0,1), lwd=c(2,2,2,2), 
##D 	 lty=c(1,1,1,2), main="",
##D          ylab=expression((K(r)/pi*r^2)-1))
##D 
##D ## Analyses as in fig. 3.7 of De la Cruz (2008).
##D ## First, compute function K and pointwise envelopes:
##D 
##D cosa1.env <- envelope(fig1.ppp, Kest)
##D 
##D cosa2.env <- envelope(fig2.ppp, Kest)
##D 
##D cosa3.env <- envelope(fig3.ppp, Kest)
##D 
##D ## Plot function L with pointwise envelopes:
##D 
##D plot(cosa1.env,sqrt(./pi)-r~r, lwd=c(1,1,2,2), 
##D 	 lty=c(1,1,3,3), col=c(1,1,1,1), xlab="r", 
##D          ylab="L(r)", main="", ylim=c(-2,2))
##D 
##D ## Add simultaneous envelopes of Ripley (+-1.68 *sqrt(A)/N):
##D 
##D abline(h=1.68*sqrt(fig1.ppp$w$area)/fig1.ppp$n, 
##D          lty=2, lwd=2)
##D 
##D abline(h=-1.68*sqrt(fig1.ppp$w$area)/fig1.ppp$n, 
##D          lty=2, lwd=2)
##D 
##D ## Plot function L with pointwise envelopes:
##D 
##D plot(cosa2.env,sqrt(./pi)-r~r, lwd=c(1,1,2,2), 
##D          lty=c(1,1,3,3), col=c(1,1,1,1), xlab="r", 
##D          ylab="L(r)", main="")
##D 
##D ## Add simultaneous envelopes of Ripley:
##D 
##D abline(h=1.68*sqrt(fig2.ppp$w$area)/fig2.ppp$n, 
##D          lty=2, lwd=2)
##D 
##D abline(h=-1.68*sqrt(fig2.ppp$w$area)/fig2.ppp$n, 
##D          lty=2, lwd=2)
##D 
##D ## Plot function L with pointwise envelopes:
##D 
##D plot(cosa3.env,sqrt(./pi)-r~r, lwd=c(1,1,2,2), 
##D          lty=c(1,1,3,3), col=c(1,1,1,1), xlab="r", 
##D          ylab="L(r)", main="")
##D 
##D ## Add simultaneous envelopes of Ripley:
##D 
##D abline(h=1.68*sqrt(fig3.ppp$w$area)/fig3.ppp$n, 
##D          lty=2, lwd=2)
##D 
##D abline(h=-1.68*sqrt(fig3.ppp$w$area)/fig3.ppp$n, 
##D          lty=2, lwd=2)
## End(Not run)



