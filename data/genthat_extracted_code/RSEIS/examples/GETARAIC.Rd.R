library(RSEIS)


### Name: GETARAIC
### Title: Auto-Regressive AIC estimate of arrival time
### Aliases: GETARAIC
### Keywords: misc hplot

### ** Examples



data(CE1)
plot(CE1$x, CE1$y, type='l')

Xamp = CE1$y[CE1$x>4.443754 & CE1$x<6.615951]
Mar=8
z4 = Xamp
DT = CE1$dt
 T1 = 50

O1 = 10*DT
O2 =  10*DT
WW = 10*DT
Nz4 = length(z4)


 araict = GETARAIC(Xamp, DT=CE1$dt, Mar=8, T1=T1, O1=O1, O2=O2, WW=WW,   PLOT=TRUE)





