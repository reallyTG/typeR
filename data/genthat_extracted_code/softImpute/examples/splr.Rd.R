library(softImpute)


### Name: splr
### Title: create a 'SparseplusLowRank' object
### Aliases: splr
### Keywords: classes models multivariate

### ** Examples

x=matrix(sample(c(3,0),15,replace=TRUE),5,3)
x=as(x,"sparseMatrix")
a=matrix(rnorm(10),5,2)
b=matrix(rnorm(6),3,2)
new("SparseplusLowRank",x=x,a=a,b=b)
splr(x,a,b)



