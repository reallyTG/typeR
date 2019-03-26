library(FitAR)


### Name: AcfPlot
### Title: Basic ACF Plotting
### Aliases: AcfPlot
### Keywords: ts

### ** Examples

#
#Simple example, plot acf for AR(1)
 phi<-0.8
 maxLag<-20
 g<-phi^(1:maxLag)
 AcfPlot(g)
 AcfPlot(g, LagZeroQ=FALSE)
#
# Plot the sample inverse partial autocorrelations. 
# On the basis of this plot, Cleveland (1972) suggested an ARp(1,2,7)
# for this data
"InverseAcf" <-
function(z, p=15){
g<-TacvfMA(GetFitARpLS(z-mean(z),1:p)$phiHat, lag.max=p)
g/g[1]
}
#
data(SeriesA)
AcfPlot(InverseAcf(SeriesA),LagZeroQ=FALSE)



