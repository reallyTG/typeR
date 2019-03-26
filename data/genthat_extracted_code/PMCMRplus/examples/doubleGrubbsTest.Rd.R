library(PMCMRplus)


### Name: doubleGrubbsTest
### Title: Grubbs Double Outlier Test
### Aliases: doubleGrubbsTest
### Keywords: htest

### ** Examples

data(Pentosan)
dat <- subset(Pentosan, subset = (material == "A"))
labMeans <- tapply(dat$value, dat$lab, mean)
doubleGrubbsTest(x = labMeans, alternative = "less")



