library(ade4)


### Name: bsetal97
### Title: Ecological and Biological Traits
### Aliases: bsetal97
### Keywords: datasets

### ** Examples

data(bsetal97)
X <- prep.fuzzy.var(bsetal97$biol, bsetal97$biol.blo)
Y <- prep.fuzzy.var(bsetal97$ecol, bsetal97$ecol.blo)
plot(coinertia(dudi.fca(X, scan = FALSE), 
    dudi.fca(Y, scan = FALSE), scan = FALSE))



