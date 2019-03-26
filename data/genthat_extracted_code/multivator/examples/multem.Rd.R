library(multivator)


### Name: multem
### Title: The multivariate emulator
### Aliases: multem

### ** Examples

data(mtoys)
d <- obs_maker(toy_mm, toy_mhp, toy_LoF, toy_beta)
ex <- experiment(toy_mm , d)

Sigmainv <- solve(var.matrix(toy_mm,hp=toy_mhp))
multem(x=toy_mm2, expt=ex, hp=toy_mhp,LoF=toy_LoF, give=TRUE)




