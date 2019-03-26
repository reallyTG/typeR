library(spider)


### Name: haploAccum
### Title: Haplotype accumulation curves
### Aliases: haploAccum
### Keywords: Sampling

### ** Examples


data(dolomedes)
#Generate multiple haplotypes
doloHaplo <- dolomedes[sample(37, size = 200, replace = TRUE), ] 
dolocurv <- haploAccum(doloHaplo, method = "random", permutations = 100)
dolocurv
graphics::plot(dolocurv)




