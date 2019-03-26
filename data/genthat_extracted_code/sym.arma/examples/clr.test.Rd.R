library(sym.arma)


### Name: clr.test
### Title: Conditional Likelihood Ratio Test
### Aliases: clr.test

### ** Examples

serie <- symarma.sim(model=list(ar=c(0.2,0.5)),n=70,family="Normal",
 varphi=1)
model0 <- elliptical.ts(serie,order=c(2,0,0))
model1 <- elliptical.ts(serie,order=c(1,0,0))
clr.test(model0,model1)



