library(shotGroups)


### Name: rangeStat
### Title: Distribution of range statistics
### Aliases: rangeStat pRangeStat qRangeStat rRangeStat
### Keywords: distribution

### ** Examples

(q45 <- pRangeStat(c(4, 5), sigma=1.5, n=5, nGroups=3, stat="ES"))

# should be the 4 and 5
qRangeStat(q45, sigma=1.5, n=5, nGroups=3, stat="ES")

rRangeStat(5, sigma=2, nPerGroup=5, nGroups=3, stat="D")



