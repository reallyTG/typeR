library(shapes)


### Name: distcov
### Title: Compute a distance between two covariance matrices
### Aliases: distcov
### Keywords: multivariate

### ** Examples



A <- diag(5)
B <- A + .1*matrix(rnorm(25),5,5) 
S1<-A
S2<- B

distcov( S1, S2, method="Procrustes")




