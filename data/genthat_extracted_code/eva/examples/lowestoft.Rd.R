library(eva)


### Name: lowestoft
### Title: Top Ten Annual Sea Levels: Lowestoft, UK (1964 - 2014)
### Aliases: lowestoft
### Keywords: datasets

### ** Examples

data(lowestoft)
gevrSeqTests(lowestoft, method = "ed")
## Not run
## Look at the difference in confidence intervals between r = 1 and r = 10
# z1 <- gevrFit(lowestoft[, 1])
# z2 <- gevrFit(lowestoft)
# gevrRl(z1, 50, method = "profile")
# gevrRl(z2, 50, method = "profile")



