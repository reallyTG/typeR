library(DistributionOptimization)


### Name: OverlapErrorByDensity
### Title: OverlapErrorByDensity
### Aliases: OverlapErrorByDensity

### ** Examples

Data = c(rnorm(50,1,2), rnorm(50,3,4))
V<-OverlapErrorByDensity(c(1,3), c(2,4), c(0.5,0.5), Data = Data)
AdaptGauss::PlotMixtures(Data, c(1,3), c(2,4), SingleGausses = TRUE)
print(V$OverlapError)



