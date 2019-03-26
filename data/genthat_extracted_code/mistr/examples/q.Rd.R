library(mistr)


### Name: q.compdist
### Title: Quantile Function
### Aliases: q.compdist q q.standist q.trans_univdist

### ** Examples

N <- normdist(1, 3)
q(N, c(NA, 1, 3, 5))

C <- cauchydist()
CC <- compdist(N, C, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*C+5
q(CCC, c(NA, 1, 3, 5))



