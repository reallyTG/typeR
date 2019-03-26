library(phylolm)


### Name: rbinTrait
### Title: Binary trait simulation
### Aliases: rbinTrait

### ** Examples

tre = rtree(50)
x = rTrait(n=1,phy=tre)
X = cbind(rep(1,50),x)
y = rbinTrait(n=1, phy=tre, beta=c(-1,0.5), alpha=1, X=X)



