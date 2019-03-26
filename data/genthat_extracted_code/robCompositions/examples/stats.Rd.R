library(robCompositions)


### Name: stats
### Title: Classical estimates for tables
### Aliases: stats

### ** Examples

data(precipitation) 
tab1 <- indTab(precipitation)
stats(precipitation)
stats(precipitation, statistics = "cramer")
stats(precipitation, statistics = "chisq")
stats(precipitation, statistics = "yates")

## take with care 
## (the provided statistics are not designed for that case):
stats(precipitation, statistics = "chisq", maggr = gmean)



