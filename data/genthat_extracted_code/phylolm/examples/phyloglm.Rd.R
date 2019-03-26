library(phylolm)


### Name: phyloglm
### Title: Phylogenetic Generalized Linear Model
### Aliases: phyloglm

### ** Examples

set.seed(123456)
tre = rtree(50)
x = rTrait(n=1,phy=tre)
X = cbind(rep(1,50),x)
y = rbinTrait(n=1,phy=tre, beta=c(-1,0.5), alpha=1 ,X=X)
dat = data.frame(trait01 = y, predictor = x)
fit = phyloglm(trait01~predictor,phy=tre,data=dat,boot=100)
summary(fit)
coef(fit)
vcov(fit)



