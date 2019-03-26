library(samplesize)


### Name: n.ttest
### Title: n.ttest computes sample size for paired and unpaired t-tests.
### Aliases: n.ttest
### Keywords: htest

### ** Examples

n.ttest(power = 0.8, alpha = 0.05, mean.diff = 0.80, sd1 = 0.83, k = 1,
design = "unpaired", fraction = "balanced", variance = "equal")

n.ttest(power = 0.8, alpha = 0.05, mean.diff = 0.80, sd1 = 0.83, sd2 =
2.65, k = 0.7, design = "unpaired", fraction = "unbalanced", variance =
"unequal")



