library(phylolm)


### Name: phylostep
### Title: Stepwise model selection for Phylogenetic Linear Model
### Aliases: phylostep

### ** Examples

set.seed(123456)
tre = rcoal(60)
taxa = sort(tre$tip.label)
b0=0; b1=1;
x1 = rTrait(phy=tre,model="BM",
           parameters=list(ancestral.state=0,sigma2=10))
x2 = rTrait(phy=tre,model="BM",
            parameters=list(ancestral.state=0,sigma2=10))
x3 = rTrait(phy=tre,model="BM",
            parameters=list(ancestral.state=0,sigma2=10))
y <- b0 + b1*x1 + 
     rTrait(n=1,phy=tre,model="BM",parameters=list(
              ancestral.state=0,sigma2=1))
dat = data.frame(trait=y[taxa],pred1=x1[taxa],pred2=x2[taxa],pred3=x3[taxa])
fit = phylostep(trait~pred1+pred2+pred3,data=dat,phy=tre,model="BM",direction="both")
summary(fit)



