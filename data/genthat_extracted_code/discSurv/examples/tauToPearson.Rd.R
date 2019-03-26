library(discSurv)


### Name: tauToPearson
### Title: Transformation of Tau to Pearson correlation
### Aliases: tauToPearson
### Keywords: survival

### ** Examples

# Plot of relation between kendalls tau and pearson correlation
MaxDisc1 <- nlminb(start=0.5, objective=function (x) -abs(tauToPearson (x)-x))
MaxDisc2 <- nlminb(start=-0.5, objective=function (x) -abs(tauToPearson (x)-x))
plot(x=seq(-1,1,length.out=500), y=tauToPearson(seq(-1,1,length.out=500)), 
xlab=expression(tau), ylab=expression(rho), type="l", las=1, 
main="Relationship between tau and pearson correlation (bivariate normal)", lwd=2)
lines(x=seq(-1,1,length.out=500), y=seq(-1,1,length.out=500), lty=2)
segments(x0=0, y0=-1.25, x1=0, y1=0, lty=2)
segments(x0=-1.25, y0=0, x1=0, y1=0, lty=2)
segments(x0=MaxDisc1$par, y0=-1.25, x1=MaxDisc1$par, y1=tauToPearson (MaxDisc1$par), lty=2)
segments(x0=MaxDisc2$par, y0=-1.25, x1=MaxDisc2$par, y1=tauToPearson (MaxDisc2$par), lty=2)

# The maximum discrepancy between pearson and spearman is at 
# a kendalls tau value about 0.56 and -0.56



