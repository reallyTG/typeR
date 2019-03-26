library(fuzzyRankTests)


### Name: fuzzy.signrank.test
### Title: Fuzzy P-value, Decision, or Confidence Interval for the Rank Sum
###   Test
### Aliases: fuzzy.signrank.test fuzzy.signrank.ci
### Keywords: htest

### ** Examples

#### make up data ####
x <- c(-3, -2, -2, 0, 0, 0, 0, 1, 2, 3, 4, 4, 4, 5, 6, 7)
fuzzy.signrank.test(x, alt = "less")
plot(fuzzy.signrank.test(x, alt = "less"))
fuzzy.signrank.ci(x)
plot(fuzzy.signrank.ci(x))



