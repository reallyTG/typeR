library(QuantPsyc)


### Name: mult.norm
### Title: Tests for Multivariate Normality
### Aliases: mult.norm
### Keywords: multivariate distribution

### ** Examples


# assess the multivariate normality of variables 4,5,6 in USJudgeRatings
data(USJudgeRatings)	
mn <- mult.norm(USJudgeRatings[,4:6],chicrit=.001)
mn

mn$Dsq > mn$CriticalDsq




