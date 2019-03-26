library(SCRT)


### Name: distribution.random
### Title: Nonexhaustive randomization distribution
### Aliases: distribution.random
### Keywords: Single-case design Randomization test Randomization
###   distribution

### ** Examples

data(ABAB)
distribution.random(design = "ABAB", statistic = "AA-BB", save = "no", 
number = 100, limit = 4, data = ABAB)



