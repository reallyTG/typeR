library(RSEIS)


### Name: autoreg
### Title: Auto-Regressive Spectrum Estimate
### Aliases: autoreg
### Keywords: misc hplot

### ** Examples

data(CE1)
Xamp <- CE1$y[CE1$x>5.443754 & CE1$x<5.615951]

ZIM <- autoreg(Xamp , numf=length(Xamp) , pord = 100, PLOT=FALSE,  f1=.01, f2=50)




