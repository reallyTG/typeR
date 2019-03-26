library(Sequential)


### Name: CV.Poisson
### Title: Critical values for continuous sequential analysis with Poisson
###   data.
### Aliases: CV.Poisson
### Keywords: Continuous MaxSPRT analysis

### ** Examples


## Calculates the critical value for continuous sequential analysis with
## a maximum sample size of ten expected cases under the null hypothesis,
## requiring at least 3 events to reject the null, and with a significance
## level of 0.05:

CV.Poisson(SampleSize=10,D=0,M=3,alpha=0.05)

## In this example, no critical value exist that will give the desired 0.05
## alpha level exactly. Instead, the function produces the critical value
## that makes the alpha as large as possible without exceeding 0.05.

CV.Poisson(SampleSize=3,D=1,M=1,alpha=0.05)




