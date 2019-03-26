library(HWxtest)


### Name: observedProb
### Title: Compute observed statistics for a genotype count matrix
### Aliases: observedLLR observedProb observedU observedX2

### ** Examples

t <- vec.to.matrix(c(0,3,1,5,18,1,3,7,5,2))
observedStats <- c(observedProb(t), observedLLR(t), observedU(t), observedX2(t))



