library(SequentialDesign)


### Name: initialize.data
### Title: Create Simulated Sequential Data Parameter Data Frame
### Aliases: initialize.data
### Keywords: sequential

### ** Examples

initialize.data(seed=8768, N=1, t0=0, tf=2, NStrata=2, strataRatio=c(0.2, 0.3, 0.3, 0.2),
EventRate=c(0.4, 0.5), sensitivity=0.9, PPVest=0.9, RR=3.0, MatchRatio=1, maxSampleSize=200, 
maxTest=1, totalAlpha=0.05, minEvents=5, AlphaSpendType="Wald", AlphaParameter=0.5, address=getwd(),
rate=20, offset=30)



