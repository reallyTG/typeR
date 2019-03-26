library(gb)


### Name: fit.egld
### Title: Fit Extended Generalized Lambda Distribution (EGLD/GBD)
### Aliases: fit.egld print.egld plot.egld lines.egld
### Keywords: stats

### ** Examples


b3=4;b4=4; b1=1;b2=5; # EGLD(b1,b2,b3,b4)
b1=0;b2=1; # equivalently beta(b3,b4)
b1=-3;b2=5; 
xr = rbeta(100,b3,b4)
x = xr * b2 + b1 
min(x); range(x)
sum(dbeta(xr,b3,b4,1))
x0 = seq(min(x),max(x),length=100)
x1 = (x0-b1)/b2
plot(dbeta(x1,b3,b4)/b2~x0,type='l',lwd=2,col=2)
lines(density(x),lty=2, col=2)

## no prior information on min and max
(out0 = fit.egld(x))
lines(out0,col=1)
## xmin known
(out1 = fit.egld(x,xmin=-3))
lines(out1,col=3,lwd=2)
## xmax known
(out2 = fit.egld(x,xmax=2))
lines(out2, col=4)
## both known
(out3 = fit.egld(x,xmin=-3,xmax=2))
lines(out3, col=5)





