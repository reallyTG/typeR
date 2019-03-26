library(FitAR)


### Name: TacvfAR
### Title: Theoretical Autocovariance Function of AR
### Aliases: TacvfAR
### Keywords: ts

### ** Examples

#calculate and plot the autocorrelations from an AR(2) model
# with parameter vector c(1.8,-0.9).
 g<-TacvfAR(c(1.8,-0.9),20)
 AcfPlot(g/g[1], LagZeroQ=FALSE)




