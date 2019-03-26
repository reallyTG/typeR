library(mistr)


### Name: qlim.compdist
### Title: Right-Hand Limit of Quantile Function
### Aliases: qlim.compdist qlim qlim.discrdist qlim.contdist
###   qlim.trans_univdist

### ** Examples

B <- binomdist(10, 0.3)
qlim(B, plim(B, c(NA, 1, 3, 5)))

P <- poisdist()
M <- mixdist(B, P, weights = c(0.5, 0.5))
qlim(M, plim(M, c(NA, 1, 3, 5)))

CC <- compdist(B, P, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*CC+5
qlim(CCC, plim(CCC, c(NA, 1, 3, 5)))



