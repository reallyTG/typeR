library(FitAR)


### Name: LBQPlot
### Title: Plot Ljung-Box Test P-value vs Lag
### Aliases: LBQPlot
### Keywords: ts

### ** Examples

#fit subset AR and plot diagnostic check
 out<-FitAR(SeriesA, c(1,2,7), ARModel="ARp")
 res<-resid(out)
 LBQPlot(res)
#note that plot produces LBQPlot and RacfPlot
 plot(out)



