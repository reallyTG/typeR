library(ade4)


### Name: combine.4thcorner
### Title: Functions to combine and adjust the outputs 3-table methods
### Aliases: combine.randtest.rlq combine.4thcorner p.adjust.4thcorner
### Keywords: multivariate

### ** Examples

data(aravo)
four2 <- fourthcorner(aravo$env, aravo$spe, aravo$traits, nrepet=99,modeltype=2)
four4 <- fourthcorner(aravo$env, aravo$spe, aravo$traits, nrepet=99,modeltype=4)
four.comb <- combine.4thcorner(four2,four4)
## or directly :
## four.comb <- fourthcorner(aravo$env, aravo$spe, aravo$traits, nrepet=99,modeltype=6)
summary(four.comb)
plot(four.comb, stat = "G")




