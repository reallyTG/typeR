library(pCalibrate)


### Name: twoby2Calibrate
### Title: Minimum Bayes factors and P-values from Fisher's exact test for
###   2x2 contingency tables
### Aliases: twoby2Calibrate
### Keywords: htest models & regression

### ** Examples

tab <- matrix(c(1,15,5,10), nrow=2, byrow=TRUE)
minBF.plus <- twoby2Calibrate(x=tab, type="one.sided", direction="greater")$minBF
minBF.minus <- twoby2Calibrate(x=tab, type="one.sided", direction="less")$minBF
minBF.sim <- twoby2Calibrate(x=tab, type="two.sided", alternative="simple")$minBF
minBF.nor <- twoby2Calibrate(x=tab)$minBF
p.plus <- twoby2Calibrate(x=tab, type="one.sided", direction="greater")$p.value
p.minus <- twoby2Calibrate(x=tab, type="one.sided", direction="less")$p.value
pvals.twosid <- twoby2Calibrate(x=tab)$p.value



