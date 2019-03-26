library(Sequential)


### Name: Performance.G.Poisson
### Title: Calculates statistical power, expected time to signal and
###   expected sample size for group sequential analysis with Poisson data.
### Aliases: Performance.G.Poisson

### ** Examples

## First use the CV.G.Poisson function to calculate the critical value for
## 5 sequential looks  at the data, spaced six units apart, and with a
## statistical significance level of 0.05:

cvt<- CV.G.Poisson(SampleSize=30,alpha=0.05,GroupSizes=c(6,6,6,6,6))

## For an alternative hypothesis of a relative risk of RR=1.5, calculates the
## statistical power, the expected time to signal, and the expected sample size
## at the end of the sequential analysis.

(Performance.G.Poisson(SampleSize=30,cv=cvt,GroupSizes=c(6,6,6,6,6),RR=1.5))



