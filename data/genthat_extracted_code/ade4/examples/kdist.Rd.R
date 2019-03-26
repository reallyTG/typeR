library(ade4)


### Name: kdist
### Title: the class of objects 'kdist' (K distance matrices)
### Aliases: kdist c.kdist print.kdist [.kdist as.data.frame.kdist
### Keywords: multivariate

### ** Examples

# starting from a list of matrices 
data(yanomama)
lapply(yanomama,class)  
kd1 = kdist(yanomama)
print(kd1)

# giving the correlations of Mantel's test
cor(as.data.frame(kd1))
pairs(as.data.frame(kd1))

# starting from a list of objects 'dist'
data(friday87)
fri.w <- ktab.data.frame(friday87$fau, friday87$fau.blo, 
    tabnames = friday87$tab.names)
fri.kd = lapply(1:10, function(x) dist.binary(fri.w[[x]],2))
names(fri.kd) = friday87$tab.names
unlist(lapply(fri.kd,class)) # a list of distances
fri.kd = kdist(fri.kd)
fri.kd
s.corcircle(dudi.pca(as.data.frame(fri.kd), scan = FALSE)$co)

# starting from several distances
data(ecomor)
d1 <- dist.binary(ecomor$habitat, 1)
d2 <- dist.prop(ecomor$forsub, 5)
d3 <- dist.prop(ecomor$diet, 5)
d4 <- dist.quant(ecomor$morpho, 3)
d5 <- dist.taxo(ecomor$taxo)
ecomor.kd <- kdist(d1, d2, d3, d4, d5)
names(ecomor.kd) = c("habitat", "forsub", "diet", "morpho", "taxo")
class(ecomor.kd)
s.corcircle(dudi.pca(as.data.frame(ecomor.kd), scan = FALSE)$co)

data(bsetal97)
X <- prep.fuzzy.var(bsetal97$biol, bsetal97$biol.blo)
w1 <- attr(X, "col.num")
w2 <- levels(w1)
w3 <- lapply(w2, function(x) dist.quant(X[,w1==x], method = 1))
names(w3) <- names(attr(X, "col.blocks"))
w3 <- kdist(list = w3)
s.corcircle(dudi.pca(as.data.frame(w3), scan = FALSE)$co)

data(rpjdl)
w1 = lapply(1:10, function(x) dist.binary(rpjdl$fau, method = x))
w2 = c("JACCARD", "SOCKAL_MICHENER", "SOCKAL_SNEATH_S4", "ROGERS_TANIMOTO")
w2 = c(w2, "CZEKANOWSKI", "S9_GOWER_LEGENDRE", "OCHIAI", "SOKAL_SNEATH_S13")
w2 <- c(w2, "Phi_PEARSON", "S2_GOWER_LEGENDRE")
names(w1) <- w2
w3 = kdist(list = w1)
w4 <- dudi.pca(as.data.frame(w3), scan = FALSE)$co
w4



