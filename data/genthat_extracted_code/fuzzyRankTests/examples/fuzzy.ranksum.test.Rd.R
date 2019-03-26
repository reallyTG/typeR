library(fuzzyRankTests)


### Name: fuzzy.ranksum.test
### Title: Fuzzy P-value, Decision, or Confidence Interval for the Rank Sum
###   Test
### Aliases: fuzzy.ranksum.test fuzzy.ranksum.ci
### Keywords: htest

### ** Examples

#### make up data ####
x <- c(1, 2, 3, 4, 4, 4, 5, 6, 7)
y <- c(4, 5, 7, 7, 8, 9, 10, 11)
fuzzy.ranksum.test(x, y)
plot(fuzzy.ranksum.test(x, y))
fuzzy.ranksum.ci(x, y)
plot(fuzzy.ranksum.ci(x, y))



