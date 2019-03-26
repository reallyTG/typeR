library(compound.Cox)


### Name: X.tag
### Title: Generate a matrix of gene expressions in the presence of tag
###   genes
### Aliases: X.tag
### Keywords: gene expression tag gene

### ** Examples

X.mat=X.tag(n=200,p=100,q=10,s=4)
round( colMeans(X.mat),3 ) ## mean ~ 0 ##
round( apply(X.mat, MARGIN=2, FUN=sd),3) ## SD ~ 1 ##



