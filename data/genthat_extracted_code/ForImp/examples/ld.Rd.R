library(ForImp)


### Name: ld
### Title: Listwise deletion
### Aliases: ld
### Keywords: datagen multivariate

### ** Examples

n<-10
m<-4
mat<-matrix(rnorm(n*m),n,m)
mat[c(3,6),1]<-NA
mat[10,2]<-NA
mat
ld(mat)



