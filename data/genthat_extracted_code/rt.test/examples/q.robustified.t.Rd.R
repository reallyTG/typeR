library(rt.test)


### Name: q.robustified.t
### Title: Lower quantiles of TA or TB
### Aliases: q.robustified.t

### ** Examples

# quantile value of TA (using median and MAD) statistic
q.robustified.t(p=0.01, n=10, test.stat="TA")

# quantile value of TB (using Hodges-Lehmann and Shamos) statistic
q.robustified.t(p=0.01, n=10, test.stat="TB")



