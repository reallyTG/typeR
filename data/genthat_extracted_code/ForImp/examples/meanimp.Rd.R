library(ForImp)


### Name: meanimp
### Title: Mean imputation
### Aliases: meanimp
### Keywords: datagen multivariate

### ** Examples

set.seed(1)
n<-10
m<-3
mat<-matrix(rnorm(n*m),n,m)
matm<-mat
matm[1,1]<-NA
matm[2,2:3]<-NA
# matrix with missing values
matm
# imputed matrix
meanimp(mat)
# original matrix with no missing values
mat



