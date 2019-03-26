library(FitAR)


### Name: RacfPlot
### Title: Residual Autocorrelation Plot
### Aliases: RacfPlot
### Keywords: ts

### ** Examples

#fit subset AR and plot diagnostic check
 data(SeriesA)
 out<-FitAR(SeriesA, c(1,2,7), ARModel="ARp")
 RacfPlot(out)
#note that plot produces LBQPlot and RacfPlot
 plot(out)
#check squared residuals
 RacfPlot(out, SquaredQ=TRUE)




