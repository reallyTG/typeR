library(Sequential)


### Name: Performance.G.Binomial
### Title: Statistical power, expected time to signal and expected sample
###   size for group sequential analysis for binomial data.
### Aliases: Performance.G.Binomial

### ** Examples


result<- Performance.G.Binomial(N=40,M=1,cv=2.5,z=1,RR=2,GroupSizes=c(2))
# if you type:
result
# then you will get the following output:
# $Power
# [1] 0.6594118

# $`ESignalTime`
# [1] 17.18626

# $`ESampleSize`
# [1] 24.95635



