library(sampSurf)


### Name: monteNTSample
### Title: Generate Objects of Class "'monteNTSample'"
### Aliases: monteNTSample
### Keywords: ~kwd1 ~kwd2

### ** Examples

mp = montePop(rnorm(100))
mnts = monteNTSample(mp, n=c(10,20,30))
mnts
hist(mnts)



