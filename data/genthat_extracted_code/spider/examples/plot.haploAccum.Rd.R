library(spider)


### Name: plot.haploAccum
### Title: Plotting haplotype accumulation curves
### Aliases: plot.haploAccum
### Keywords: Sampling

### ** Examples


data(dolomedes)
#Generate multiple haplotypes
doloHaplo <- dolomedes[sample(37, size = 200, replace = TRUE), ] 
dolocurv <- haploAccum(doloHaplo, method = "random", permutations = 100)

graphics::plot(dolocurv)
graphics::plot(dolocurv, add = FALSE, ci = 2, ci.type = "polygon", col = "blue", ci.col = "red", 
    ci.lty = 1)




