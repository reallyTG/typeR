library(RSEIS)


### Name: STLTcurve
### Title: Short-term/Long-term Average curve
### Aliases: STLTcurve
### Keywords: misc

### ** Examples


data(CE1)

y  = CE1$y

DT = CE1$dt



sy = STLTcurve(y, dt=DT, fwlen =  25,  bwlen  = 25,
stretch=1000, MED=255, PLOT=FALSE)

par(mfrow=c(2,1))

plot(CE1$x, CE1$y, type='l')
plot(CE1$x,sy$rat, type='l')







