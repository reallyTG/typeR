library(DistributionOptimization)


### Name: BinProb4Mixtures
### Title: Bin Probabilities
### Aliases: BinProb4Mixtures

### ** Examples

 
Data = c(rnorm(50,1,2), rnorm(50,3,4))
NoBins = AdaptGauss::OptimalNoBins(Data)
breaks = seq(min(Data),max(Data), length.out=length(NoBins)+1)
BinProb4Mixtures(c(1,3), c(2,4), c(0.5,0.5), breaks)



