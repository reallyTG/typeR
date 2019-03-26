library(binGroup)


### Name: binTest
### Title: Hypothesis tests for One Binomial Proportion
### Aliases: binTest
### Keywords: htest

### ** Examples


# 200 seeds are taken from a seed lot.
# 2 are found to be defective.
# H0: p >= 0.02  shall be rejected in favor of  HA: p < 0.02.
# The exact test shall be used for decision:

binTest(n=200, y=2, p.hyp=0.02, alternative="less", method="Exact" )




