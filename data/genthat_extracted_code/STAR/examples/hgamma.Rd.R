library(STAR)


### Name: hgamma
### Title: Hazard Functions for Some Common Duration Distributions
### Aliases: hgamma hweibull hlnorm hinvgauss hllogis hrexp
### Keywords: distribution ts

### ** Examples

## Not run: 
##D ## use a few plots to compare densities and hazard functions
##D 
##D ## lognormal
##D tSeq <- seq(0.001,0.6,0.001)
##D meanlog.true <- -2.4
##D sdlog.true <- 0.4
##D Yd <- dlnorm(tSeq,meanlog.true,sdlog.true)
##D Yh <- hlnorm(tSeq,meanlog.true,sdlog.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Lognormal Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
##D 
##D ## inverse Gaussian
##D tSeq <- seq(0.001,0.6,0.001)
##D mu.true <- 0.075
##D sigma2.true <- 3
##D Yd <- dinvgauss(tSeq,mu.true,sigma2.true)
##D Yh <- hinvgauss(tSeq,mu.true,sigma2.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Inverse Gaussian Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
##D 
##D ## gamma
##D tSeq <- seq(0.001,0.6,0.001)
##D shape.true <- 6
##D scale.true <- 0.012
##D Yd <- dgamma(tSeq, shape=shape.true, scale=scale.true)
##D Yh <- hgamma(tSeq, shape=shape.true, scale=scale.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Gamma Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
##D 
##D ## Weibull
##D tSeq <- seq(0.001,0.6,0.001)
##D shape.true <- 2.5
##D scale.true <- 0.085
##D Yd <- dweibull(tSeq, shape=shape.true, scale=scale.true)
##D Yh <- hweibull(tSeq, shape=shape.true, scale=scale.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Weibull Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
##D 
##D ## refractory exponential
##D tSeq <- seq(0.001,0.6,0.001)
##D rate.true <- 20
##D rp.true <- 0.01
##D Yd <- drexp(tSeq, rate.true, rp.true)
##D Yh <- hrexp(tSeq, rate.true, rp.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Refractory Exponential Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
##D 
##D ## log logistic
##D tSeq <- seq(0.001,0.6,0.001)
##D location.true <- -2.7
##D scale.true <- 0.025
##D Yd <- dllogis(tSeq, location.true, scale.true)
##D Yh <- hllogis(tSeq, location.true, scale.true)
##D max.Yd <- max(Yd)
##D max.Yh <- max(Yh)
##D Yd <- Yd / max.Yd
##D Yh <- Yh / max.Yh
##D oldpar <- par(mar=c(5,4,4,4))
##D plot(tSeq, Yd, type="n", axes=FALSE, ann=FALSE,
##D      xlim=c(0,0.6), ylim=c(0,1))
##D axis(2,at=seq(0,1,0.2),labels=round(seq(0,1,0.2)*max.Yd,digits=2))
##D mtext("Density (1/s)", side=2, line=3)
##D axis(1,at=pretty(c(0,0.6)))
##D mtext("Time (s)", side=1, line=3)
##D axis(4, at=seq(0,1,0.2), labels=round(seq(0,1,0.2)*max.Yh,digits=2))
##D mtext("Hazard (1/s)", side=4, line=3, col=2)
##D mtext("Log Logistic Density and Hazard Functions", side=3, line=2,cex=1.5)
##D lines(tSeq,Yd)
##D lines(tSeq,Yh,col=2)
##D par(oldpar)
## End(Not run)



