library(mistr)


### Name: parameters
### Title: Extract Model Parameters
### Aliases: parameters parameters.standist parameters.trans_standist
###   parameters.mixdist parameters.trans_mixdist parameters.compdist
###   parameters.trans_compdist parameters.comp_fit

### ** Examples

N <- normdist(1, 3)
parameters(N)

C <- cauchydist()
M <- mixdist(N, C, weights = c(0.5, 0.5))
parameters(M)



