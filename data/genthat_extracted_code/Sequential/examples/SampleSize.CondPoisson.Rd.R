library(Sequential)


### Name: SampleSize.CondPoisson
### Title: Sample size calculation for the continuous sequential CMaxSPRT
###   for Poisson data with limited information from historical cohort.
### Aliases: SampleSize.CondPoisson
### Keywords: Continuous CmaxSPRT sample size

### ** Examples


# Sample size required to obtain a power of 90%, for a relative risk of 1.5,
# no delay for starting the surveilla# nce (D=0), under an alpha level of 5%,
# with 5 events in the historical data.

# res<- SampleSize.CondPoisson(cc=50,D=0,M=1,alpha=0.05,power=0.9,RR=2)

# If we write:
# res
# then we get:

# $K
# [1] 66

# $Tal
# [1] 0.7890625

# $cv
# [1] 3.626436




