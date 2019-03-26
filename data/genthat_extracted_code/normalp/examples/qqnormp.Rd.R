library(normalp)


### Name: qqnormp
### Title: Quantile-Quantile plot for an exponential power distribution
### Aliases: qqnormp qqnormp.default qqlinep
### Keywords: hplot

### ** Examples

## Exponential power distribution Q-Q plot for a sample of 100 observations.
e<-rnormp(100,mu=0,sigmap=1,p=3)
qqnormp(e,p=3)
qqlinep(e,p=3)



