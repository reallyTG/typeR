library(abc)


### Name: postpr
### Title: Estimating posterior model probabilities
### Aliases: postpr
### Keywords: htest models

### ** Examples


## an artifical example
ss <- cbind(runif(1000),rt(1000,df=20))
postpr(target=c(3), index=c(rep("norm",500),rep("t",500)),
sumstat=ss[,1], tol=.1, method="rejection")

## human demographic history
require(abc.data)
data(human)
## five R objects are loaded. See ?human and vignette("abc") for details.

## illustrate the informativeness of two summary statistics: mean and
## variance of Tajima's D
par(mfcol = c(1,3))
boxplot(stat.3pops.sim[,"pi"]~models, main="Mean nucleotide diversity")
boxplot(stat.3pops.sim[,"TajD.m"]~models, main="Mean Tajima's D")
boxplot(stat.3pops.sim[,"TajD.v"]~models, main="Var in Tajima's D")

## model selection with ABC for the European population


modsel.it <- postpr(stat.voight["italian",], models, stat.3pops.sim, tol=.05, method="mnlogistic")
summary(modsel.it)

## In Europe, the most supported model
## is a population bottleneck 
## Check that in Africa, population expansion is the most supported model, while in
##  Asia, it is a population bottleneck
##modsel.ha <- postpr(stat.voight["hausa",], models, stat.3pops.sim, 
##tol=.05, method="mnlogistic")
##modsel.ch <- postpr(stat.voight["chinese",], models, stat.3pops.sim,
## tol=.05, method="mnlogistic")





