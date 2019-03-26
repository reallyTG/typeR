library(IPMpack)


### Name: stochGrowthRateSampleList
### Title: Estimating the stochastic population growth rate (lambda_s) or
###   invasion rat.
### Aliases: stochGrowthRateSampleList

### ** Examples

dff <- generateData()
IPMlist <- sampleSequentialIPMs(dataf = dff, nBigMatrix = 10, minSize = -5, 
maxSize = 15,fecConstants=data.frame(1e6), correction="constant")
stochGrowthRateSampleList(listIPMmatrix = IPMlist,nRunIn = 100, tMax = 5000) 



