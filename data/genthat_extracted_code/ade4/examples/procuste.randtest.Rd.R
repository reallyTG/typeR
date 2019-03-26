library(ade4)


### Name: procuste.randtest
### Title: Monte-Carlo Test on the sum of the singular values of a
###   procustean rotation (in C).
### Aliases: procuste.randtest
### Keywords: multivariate nonparametric

### ** Examples

data(doubs)
pca1 <- dudi.pca(doubs$env, scal = TRUE, scann = FALSE)
pca2 <- dudi.pca(doubs$fish, scal = FALSE, scann = FALSE)
protest1 <- procuste.randtest(pca1$tab, pca2$tab, 999)
protest1
plot(protest1,main="PROTEST")



