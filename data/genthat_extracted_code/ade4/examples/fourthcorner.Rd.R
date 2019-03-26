library(ade4)


### Name: fourthcorner
### Title: Functions to compute the fourth-corner statistic
### Aliases: fourthcorner fourthcorner2 print.4thcorner summary.4thcorner
###   plot.4thcorner fourthcorner.rlq
### Keywords: multivariate

### ** Examples

data(aviurba)

## Version using the sequential test (ter Braak et al 2012)
## as recommended in Dray et al (2013), 
## using Holm correction of P-values (only 99 permutations here)
four.comb.default <- fourthcorner(aviurba$mil,aviurba$fau,aviurba$traits,nrepet=99)
summary(four.comb.default)
plot(four.comb.default, stat = "G")

## using fdr correction of P-values
four.comb.fdr <- fourthcorner(aviurba$mil, aviurba$fau, aviurba$traits,
nrepet = 99, p.adjust.method.G = 'fdr', p.adjust.method.D = 'fdr')  
summary(four.comb.fdr)
plot(four.comb.fdr, stat = "G")

## Explicit procedure to combine the results of two models
## proposed in Dray and Legendre (2008);the above does this implicitly
four2 <- fourthcorner(aviurba$mil,aviurba$fau,aviurba$traits,nrepet=99,modeltype=2)
four4 <- fourthcorner(aviurba$mil,aviurba$fau,aviurba$traits,nrepet=99,modeltype=4)
four.comb <- combine.4thcorner(four2, four4)
summary(four.comb)
plot(four.comb, stat = "G")





