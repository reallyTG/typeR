library(conjoint)


### Name: caRankToScore
### Title: Function caRankToScore transforms ranking data into rating data
###   design
### Aliases: caRankToScore
### Keywords: multivariate

### ** Examples

#Example 1
library(conjoint)
data(ice)
print(ilevn)
print(iprof)
print(ipref)
preferences<-caRankToScore(ipref)
print(preferences)
Conjoint(preferences, iprof, ilevn)



