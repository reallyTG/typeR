library(shapes)


### Name: estcov
### Title: Weighted Frechet mean of covariance matrices
### Aliases: estcov
### Keywords: multivariate

### ** Examples


S <- array(0,c(5,5,10) )
for (i in 1:10){
tem <- diag(5)+.1*matrix(rnorm(25),5,5)
S[,,i]<- tem
}

estcov( S , method="Procrustes")




