library(mvoutlier)


### Name: locoutSort
### Title: Interactive diagnostic plot for identifying local outliers
### Aliases: locoutSort
### Keywords: multivariate robust

### ** Examples

# use data from illustrative example in paper:
data(X)
data(Y)
data(dat)
sel <- locoutSort(dat,X,Y,k=10,propneighb=0.1,chisqqu=0.975,
    sel=list(x=c(87.5,87.5,89.3,89.3),y=c(4.3,0.7,0.7,4.3)))



