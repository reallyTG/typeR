library(dfphase1)


### Name: changepoint
### Title: Detection of a sustained change-point in univariate and
###   multivariate data
### Aliases: changepoint mchangepoint changepoint.normal.limits
###   mchangepoint.normal.limits
### Keywords: htest multivariate statistical process monitoring statistical
###   process control distribution-free methods

### ** Examples

data(gravel)
changepoint(gravel[1,,])
mchangepoint(gravel)
mchangepoint(gravel,score="Signed Ranks")



