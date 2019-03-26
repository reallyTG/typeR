library(compound.Cox)


### Name: X.pathway
### Title: Generate a matrix of gene expressions in the presence of
###   pathways
### Aliases: X.pathway
### Keywords: gene expression gene pathway

### ** Examples

X.mat=X.pathway(n=200,p=100,q1=10,q2=10)
round( colMeans(X.mat),3 ) ## mean ~ 0 ##
round( apply(X.mat, MARGIN=2, FUN=sd),3) ## SD ~ 1 ##



