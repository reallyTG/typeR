library(asypow)


### Name: info.binomial.kgroup
### Title: Expected Information Matrix for Single or Multiple Group
###   Binomial
### Aliases: info.binomial.kgroup
### Keywords: htest

### ** Examples

# Find the information matrix for a 2 sample binomial with
# probability of events .2 and .4 and sample sizes 10 and 11
info.binom <- info.binomial.kgroup(c(.2,.4), c(10,11))
print(info.binom)



