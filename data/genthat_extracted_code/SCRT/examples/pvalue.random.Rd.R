library(SCRT)


### Name: pvalue.random
### Title: P-value using the Monte Carlo procedure
### Aliases: pvalue.random
### Keywords: Single-case design Randomization test P-value

### ** Examples

data(ABAB)
pvalue.random(design = "ABAB", statistic = "AA-BB", save = "no", 
number = 100, limit = 4, data = ABAB)



