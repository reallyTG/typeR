library(WCQ)


### Name: detect.qtl
### Title: Detect markers with QTL effects
### Aliases: detect.qtl
### Keywords: QTL detection False discovery rate control

### ** Examples

data(sample.markers)
data(sample.traits)
alleles <- c(1,2,3)
qlist <- detect.qtl(sample.markers, sample.traits, alleles, fdrc.method="bonferroni")



