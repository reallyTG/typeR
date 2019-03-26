library(Sequential)


### Name: Sequential-package
### Title: Analysis Support, Critical Values, Power, Time to Signal and
###   Sample Size for Sequential Analysis with Poisson and Binomial Data.
### Aliases: Sequential-package Sequential
### Keywords: Sequential analysis

### ** Examples


## Critical value for continuous sequential analyses for Poisson Data.
## Maximum sample size = 10, alpha = 0.05 and minimum number of events = 3:

cvt<- CV.Poisson(SampleSize=10,D=0,M=3,alpha=0.05)

## Statistical power and the expected time to signal for relative risk RR=2:

result<- Performance.Poisson(SampleSize=10,D=0,M=3,cv=cvt,RR=2)

# And if you type:
result

# Then you will see the following:
#          Power ESignalTime ESampleSize
#     [1,] 0.7329625    4.071636    5.654732




