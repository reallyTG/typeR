library(ica)


### Name: acy
### Title: Amari-Cichocki-Yang Error
### Aliases: acy

### ** Examples

##########   EXAMPLE   ##########

set.seed(1)
X <- matrix(runif(16),4,4)
Y <- matrix(runif(16),4,4)
Z <- X[,c(3,1,2,4)]%*%diag(1:4)
acy(X,Y)
acy(X,Z)




