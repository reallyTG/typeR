library(ForImp)


### Name: missingness
### Title: Missing values
### Aliases: missingness
### Keywords: datagen multivariate

### ** Examples

n<-100
m<-3
mat<-matrix(rnorm(n*m),n,m)
nummissing<-50
index<-sample(n*m,nummissing,replace=FALSE)
mat[index]<-NA
missingness(mat)



