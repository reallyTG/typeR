library(PMCMRplus)


### Name: grubbsTest
### Title: Grubbs Outlier Test
### Aliases: grubbsTest
### Keywords: htest

### ** Examples

data(Pentosan)
dat <- subset(Pentosan, subset = (material == "A"))
labMeans <- tapply(dat$value, dat$lab, mean)
grubbsTest(x = labMeans, alternative = "two.sided")



