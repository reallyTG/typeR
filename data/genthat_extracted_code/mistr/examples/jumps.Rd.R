library(mistr)


### Name: jumps
### Title: Probability mass points
### Aliases: jumps jumps.discrdist jumps.trans_discrdist jumps.contdist
###   jumps.trans_contdist jumps.mixdist jumps.trans_mixdist jumps.compdist
###   jumps.trans_compdist

### ** Examples

B <- binomdist(12, 0.4)
P <- poisdist(2)

I <- c(-7, 16.8)
jumps(B, I)
jumps(P, I)



