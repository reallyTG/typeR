library(FitARMA)


### Name: TacvfARMA
### Title: Theoretical Autocovariance Function of ARMA
### Aliases: TacvfARMA
### Keywords: ts

### ** Examples

#calculate and plot the autocorrelations from an ARMA(1,1) model
# with parameters phi=0.9 and theta=0.5
 g<-TacvfARMA(0.9,0.5,20)
 AcfPlot(g/g[1], LagZeroQ=FALSE)



