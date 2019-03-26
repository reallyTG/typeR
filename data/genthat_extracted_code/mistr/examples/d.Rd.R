library(mistr)


### Name: d.compdist
### Title: Density Function
### Aliases: d.compdist d.trans_compdist d.mixdist d.trans_mixdist d
###   d.standist d.trans_contdist d.trans_discrdist

### ** Examples

N <- normdist(1, 3)
d(N, c(NA, 1, 3, 5))

C <- cauchydist()
M <- mixdist(N, C, weights = c(0.5, 0.5))
d(M, c(NA, 1, 3, 5))

CC <- compdist(N, C, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*C+5
d(CCC, c(NA, 1, 3, 5))



