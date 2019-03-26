library(SYNCSA)


### Name: print.syncsa
### Title: SYNCSA
### Aliases: print.syncsa syncsa SYNCSA print.syncsa
### Keywords: SYNCSA

### ** Examples

data(ADRS)
syncsa(ADRS$community, ADRS$traits, ADRS$phylo, ADRS$envir, permutations = 99)
data(flona)
put.together<-list(c("fol","sem"), c("tam", "red"))
put.together
res<-syncsa(flona$community, flona$traits, envir = flona$environment,
   put.together = put.together, permutations = 99)
res$weights



