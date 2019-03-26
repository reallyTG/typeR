library(ClassComparison)


### Name: TwoGroupStats-class
### Title: Class "TwoGroupStats"
### Aliases: TwoGroupStats TwoGroupStats-class
###   as.data.frame,TwoGroupStats-method plot,TwoGroupStats,missing-method
###   print,TwoGroupStats-method show,TwoGroupStats-method
###   summary,TwoGroupStats-method
### Keywords: classes hplot univar

### ** Examples

showClass("TwoGroupStats")
bogus <- matrix(rnorm(30*1000, 8, 3), ncol=30, nrow=1000)
splitter <- rep(FALSE, 30)
splitter[16:30] <- TRUE

x <- TwoGroupStats(bogus, splitter)
summary(x)

opar<-par(mfrow=c(2,3), pch='.')
plot(x)
par(opar)



