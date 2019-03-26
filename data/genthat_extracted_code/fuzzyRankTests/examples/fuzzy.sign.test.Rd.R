library(fuzzyRankTests)


### Name: fuzzy.sign.test
### Title: Fuzzy P-value, Decision, or Confidence Interval for the Sign
###   Test
### Aliases: fuzzy.sign.test fuzzy.sign.ci
### Keywords: htest

### ** Examples

#### make up data ####
x <- c(-1.2, -0.7, 0.2, 0.2, 0.2, 0.3, 0.4, 0.9, 0.9, 1.0, 1.0,
    1.1, 1.5, 1.7, 1.9, 3.5, 5.1)
fuzzy.sign.test(x)
plot(fuzzy.sign.test(x))
fuzzy.sign.ci(x)
plot(fuzzy.sign.ci(x))



