library(mistr)


### Name: plim.compdist
### Title: Left-Hand Limit of Distribution Function
### Aliases: plim.compdist plim.mixdist plim plim.discrdist plim.contdist
###   plim.trans_univdist

### ** Examples

B <- binomdist(10, 0.3)
plim(B, c(NA, 1, 3, 5))

P <- poisdist()
M <- mixdist(B, P, weights = c(0.5, 0.5))
plim(M, c(NA, 1, 3, 5))

CC <- compdist(B, P, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*CC+5
plim(CCC, c(NA, 1, 3, 5))



