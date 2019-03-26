library(BenfordTests)


### Name: simulateH0
### Title: Function for Simulating the H0-Distributions needed for
###   BenfordTests
### Aliases: simulateH0
### Keywords: htest distribution

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

#calculate critical value for chisquare test via simulation
quantile(simulateH0(teststatistic="chisq", n=100,digits=1,pvalsims=100000),probs=.95)

#calculate the "real" critical value
qchisq(.95,df=8)

#alternatively look at critical values for the jpsq statistic
#for different sample sizes (notice the low value for pvalsims)
set.seed(421)
apply(sapply((1:9)*10,FUN=simulateH0,teststatistic="jpsq", digits=1, pvalsims=100),
MARGIN=2,FUN=quantile,probs=.05)



