library(depend.truncation)


### Name: Logrank.stat.tie
### Title: The weighted log-rank statistics for testing quasi-independence
###   (with ties in data)
### Aliases: Logrank.stat.tie
### Keywords: Copula Quasi-independence test

### ** Examples

x.trunc=c(10,5,7,1,3,9)
z.trunc=c(12,11,8,6,4,13)
d=c(1,1,1,1,0,1)
Logrank.stat.tie(x.trunc,z.trunc,d)
Logrank.stat(x.trunc,z.trunc,d) ## since there is no tie, the results are the same.



