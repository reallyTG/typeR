library(matrixTests)


### Name: cortest
### Title: correlation
### Aliases: cortest row_cor_pearson col_cor_pearson

### ** Examples

X <- iris[iris$Species=="setosa",1:4]
Y <- iris[iris$Species=="virginica",1:4]
col_cor_pearson(X, Y)
row_cor_pearson(t(X), t(Y))




