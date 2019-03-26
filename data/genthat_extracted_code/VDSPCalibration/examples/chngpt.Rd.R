library(VDSPCalibration)


### Name: chngpt
### Title: Piecewise Regression Estimation
### Aliases: chngpt

### ** Examples

### Generate equally spaced TEST VALUES in the interval [20,200]
set.seed(123456789)
x= 20 + 180*1:100/100
x2= (x - 95)*(x>=95)

# Generate REFERENCE VALUES
y = -8 + 1.5*x - 0.85*x2 + 15*rnorm(100)

#Plot test values versus reference values along with fitted piecewise model
plot(x,y)
fit.chngpt = chngpt(x,y)
plot(fit.chngpt$x[order(fit.chngpt$yfitted)],
     fit.chngpt$y[order(fit.chngpt$yfitted)],
     xlim=c(0,200), ylim=c(0,200), xlab="25-Hydroxyvitamin D (nmol/mL), IDS",
     ylab="25-Hydroxyvitamin D (nmol/mL), LC/MS", bty="n", las=1)
lines(fit.chngpt$x[order(fit.chngpt$yfitted)],
      fit.chngpt$yfitted[order(fit.chngpt$yfitted)], lty=2,col=2, lwd=2)
abline(v=fit.chngpt$chngpt, lty=2,col=3, lwd=2)
arrows(fit.chngpt$chngpt+20 ,15, fit.chngpt$chngpt,-8, length=0.1, lwd=2, col=4)
legend(fit.chngpt$chngpt + 5,30, legend=round(fit.chngpt$chngpt, digits=1),
       bty="n", col=4)





