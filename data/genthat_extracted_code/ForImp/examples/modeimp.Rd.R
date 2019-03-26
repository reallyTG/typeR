library(ForImp)


### Name: modeimp
### Title: Mode imputation
### Aliases: modeimp
### Keywords: datagen multivariate

### ** Examples

set.seed(1)
n<-10
m<-3
mat<-matrix(ceiling(runif(n*m)*4),n,m)
matm<-mat
matm[1,3]<-NA
matm[9:10,1]<-NA
# matrix with missing values
matm
# imputed matrix
modeimp(mat)
# original matrix with no missing values
mat



