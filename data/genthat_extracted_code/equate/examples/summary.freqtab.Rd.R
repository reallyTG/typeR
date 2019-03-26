library(equate)


### Name: summary.freqtab
### Title: Descriptive Statistics for Frequency Tables
### Aliases: summary.freqtab mean.freqtab sd.freqtab var.freqtab
###   cov.freqtab cor.freqtab min.freqtab max.freqtab range.freqtab
###   skew.freqtab kurt.freqtab
### Keywords: methods

### ** Examples


summary(as.freqtab(ACTmath[, 1:2]))

ny <- freqtab(KBneat$y, scales = list(0:36, 0:12))
summary(ny)
cov.freqtab(ny)



