library(ade4)


### Name: randtest.dpcoa
### Title: Permutation test for double principal coordinate analysis
###   (DPCoA)
### Aliases: randtest.dpcoa

### ** Examples

data(humDNAm)
dpcoahum <- dpcoa(data.frame(t(humDNAm$samples)), sqrt(humDNAm$distances), scan = FALSE, nf = 2)
randtest(dpcoahum)



