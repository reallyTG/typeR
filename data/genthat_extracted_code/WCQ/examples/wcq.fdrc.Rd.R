library(WCQ)


### Name: wcq.fdrc
### Title: WCQ QTL detection with false discovery rate control
### Aliases: wcq.fdrc
### Keywords: QTL detection False discovery rate control

### ** Examples

data(sample.markers)
data(sample.traits)
alleles <- c(1,2,3)
wcq.fdrc(sample.markers, sample.traits, alleles, fdrc.method="bonferroni")



