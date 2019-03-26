library(mvmeta)


### Name: vechMat
### Title: Vectorization and expansion of symmetric matrices
### Aliases: vechMat xpndMat
### Keywords: manip

### ** Examples

# GENERATE A POSITIVE-DEFINITE MATRIX, VECTORIZE IT AND THEN RE-EXPAND
(M <- crossprod(matrix(rnorm(9),3)))
(v <- vechMat(M))
xpndMat(v)

# EXTRACT VECTORIZED S, EXPAND TO A LIST, AND RE-VECTORIZE
(S <- as.matrix(berkey98[5:7]))
(Slist <- lapply(seq(nrow(S)),function(i) xpndMat(S[i,])))
t(sapply(Slist,vechMat))



