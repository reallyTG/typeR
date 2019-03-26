library(sigr)


### Name: wrapBinomTest.data.frame
### Title: Wrap binom.test (test of Binomial/Bernoulli rate).
### Aliases: wrapBinomTest.data.frame

### ** Examples


d <- data.frame(x = c(rep(0, 3), rep(1, 7)))
wrapBinomTest(d, "x", 1, p = 0.5)
d <- data.frame(x = c(rep(0, 15), rep(1, 35)))
wrapBinomTest(d, "x", 1, p = 0.5)





