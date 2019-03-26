library(SuppDists)


### Name: NormalScore
### Title: Normal Scores distribution
### Aliases: NormScore dNormScore pNormScore qNormScore rNormScore
###   sNormScore normOrder
### Keywords: distribution

### ** Examples


#Assuming three treatments, each with a sample size of 5
pNormScore(2, 3, 15, 0.6)
pNormScore(c(0.11,1.5,5.6), 3, 15, 0.6) ## approximately 5% 50% and 95%
sNormScore(3, 15, 0.6)
plot(function(x)dNormScore(x,c=5, N=15, U=0.6),0,5)




