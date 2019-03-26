library(mistr)


### Name: r.compdist
### Title: Random Generation
### Aliases: r.compdist r.mixdist r r.standist r.hyperdist r.wilcoxdist
###   r.trans_univdist

### ** Examples

N <- normdist(1, 3)
r(N, 5)

C <- cauchydist()
M <- mixdist(N, C, weights = c(0.5, 0.5))
r(M, 5)

CC <- compdist(N, C, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*C+5
r(CCC, 5)



