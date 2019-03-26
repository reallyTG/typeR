library(asbio)


### Name: perm.fact.test
### Title: Permutation test for two and three way factorial designs
### Aliases: perm.fact.test
### Keywords: univar htest

### ** Examples

lizard<-data.frame(ants=c(13,242,105,8,59,20,515,488,88,18,44,21,182,21,7,24,312,68,
460,1223,990,140,40,27),size=factor(c(rep(1,12),rep(2,12))),
month=factor(rep(rep(c(1,2,3,4),each=3),2)))
attach(lizard)
perm.fact.test(ants,month,size,perm=100, method = "b")



