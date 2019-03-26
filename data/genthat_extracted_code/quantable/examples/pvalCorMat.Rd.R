library(quantable)


### Name: pvalCorMat
### Title: pvalues for correlation matrix -
### Aliases: pvalCorMat

### ** Examples


mat = matrix(rnorm(10*20),ncol=10)
res = pvalCorMat(mat)
image(res$pval)
image(res$cor)



