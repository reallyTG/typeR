library(gb)


### Name: fit.gld
### Title: Fitting a Ramberg-Schmeiser-Tukey (RST) lambda distribution
### Aliases: fit.gld plot.gld print.gld lines.gld
### Keywords: stats

### ** Examples


mu = 34.5; sig=1.5
y = rnorm(1000,mu,sig)
x = round(y)  ###  rounding errors

x0 = seq(min(y),max(y),length=100)
f0 = dnorm(x0,mu,sig)
plot(f0~x0,type='l')
lines(density(y),col=4)
## fit with method of moments
(out1 = fit.gld(x, method='MoM')) 
lines(out1,col=2)
##  Method of percentile
(out2 = fit.gld(x, method='mop'))
lines(out2, col=3)
## Method of L-moments
(out3 = fit.gld(x, method='lmom'))
lines(out3, col=5)
##  Fitting EGLD
(out0 = fit.egld(x))
lines(out0,col=6)

legend(max(x0), max(f0), xjust=1,yjust=1,
  legend=c("true","kde","MoM","MoP","LMoM","egld"),
  lty=c(1,1,1,1,1,1),
  col=c(1,4,2,3,5,6))




