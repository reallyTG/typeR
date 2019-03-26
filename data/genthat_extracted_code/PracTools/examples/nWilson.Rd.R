library(PracTools)


### Name: nWilson
### Title: Calculate a simple random sample size for estimating a
###   proportion
### Aliases: nWilson
### Keywords: methods survey

### ** Examples

# srs sample size using Wilson method so that half-width of a 95% CI
# is 0.01. Population proportion is 0.04
nWilson(moe.sw = 1, pU = 0.04, e = 0.01)



