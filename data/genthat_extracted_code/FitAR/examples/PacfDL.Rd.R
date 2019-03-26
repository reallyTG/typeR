library(FitAR)


### Name: PacfDL
### Title: Partial Autocorrelations via Durbin-Levinson
### Aliases: PacfDL
### Keywords: ts

### ** Examples

#first define a function to compute the Sample Autocovariances
 sacvf<-function(z, lag.max){
 c(acf(z, plot=FALSE, lag.max=lag.max)$acf)*(length(z)-1)/length(z)
 }
#now compute PACF and also fit AR(7) to SeriesA
 ck<-sacvf(SeriesA, 7)
 PacfDL(ck)
 PacfDL(ck, LinearPredictor = TRUE)
#compare with built-in functions
 pacf(SeriesA, lag.max=7, plot=FALSE)
 ar(SeriesA, lag.max=7, method="yw")
#fit an optimal linear predictor of order 10 to MA(1)
 g<-TacvfMA(0.8,5)
 PacfDL(g, LinearPredictor=TRUE)
#
#Compute the theoretical pacf for MA(1) and plot it
 ck<-c(1,-0.4,rep(0,18))
 AcfPlot(PacfDL(ck)$Pacf)
 title(main="Pacf of MA(1), r(1)=-0.4")




