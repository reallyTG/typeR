library(mistr)


### Name: p.compdist
### Title: Distribution Function
### Aliases: p.compdist p.mixdist p p.standist p.trans_univdist

### ** Examples

N <- normdist(1,3)
p(N, c(NA,1,3,5))

C <- cauchydist()
M <- mixdist(N, C, weights = c(0.5, 0.5))
p(M, c(NA,1,3,5))

CC <- compdist(N, C, weights = c(0.5, 0.5), breakpoints = 1)
CCC <- 2*C+5
p(CCC, c(NA,1,3,5))



