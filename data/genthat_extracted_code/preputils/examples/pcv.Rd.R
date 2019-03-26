library(preputils)


### Name: pcv
### Title: PCA on automatically selected attributes in high dimensional
###   data
### Aliases: pcv

### ** Examples

    pcs <- pcv(t(iris[1:4]),cols=2)    
    cor(pcs,iris[-5])



