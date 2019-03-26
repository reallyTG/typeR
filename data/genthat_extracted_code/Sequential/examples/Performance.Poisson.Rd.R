library(Sequential)


### Name: Performance.Poisson
### Title: Calculates statistical power, expected time to signal and
###   expected sample size for continuous sequential analysis with Poisson
###   data.
### Aliases: Performance.Poisson

### ** Examples

## Suppose we want to find the statistical power to detect a relative risk
## of 2 when doing up to at most 20 months of surveillance, as well as the
## expected time to signal when the null hypothesis is rejected. During 
## each month, we expected to see 0.5 events if the null hypothesis is true. 
## This means that the upper limit on the sample size is 20*0.5=10 expected
## events under the null hypothesis. We will then first calculate the critical
## value for an upper limit on the sample size equal to 10 and a significance
## level of alpha=0.05:

# cvt<- CV.Poisson(SampleSize=10,alpha=0.05)
# cvt
# [1] 3.467952

## After that, we use the Performance.Poisson function to calculate the
## power and the expected time to signal when the null hypothesis is
## rejected for the alternative hypothesis with a relative risk equal to 2:

## Power, expected signal time and expected sample size for a relative risk
## equal to 2:
# Performance.Poisson(SampleSize=10,cv=cvt,RR=2)
#         Power    ESignalTime    ESampleSize 
# [1,] 0.6850634     4.130985      5.979353)

## From the results, we see that the statistical power is 68.5%. When the null
## is rejected, the expected time to signal is 4.13 in the unit of events
## expected under the null. If data is collected uniformly over time at the
## rate of 0.5 expected counts per month,the expected time to signal is
## 4.13/0.5= 8.26 months.

## The above calculations can also be accomplished using one single command line:

#  Performance.Poisson(SampleSize=10,cv=CV.Poisson(SampleSize=10,alpha=0.05),RR=2)
#         Power    ESignalTime    ESampleSize
#  [1,] 0.6850634     4.130985      5.979353



