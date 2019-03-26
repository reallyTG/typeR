library(MAVE)


### Name: mave.dim
### Title: Select best direction using cross-validation
### Aliases: mave.dim

### ** Examples

 x <- matrix(rnorm(400*5),400,5)
 b1 <- matrix(c(1,1,0,0,0),5,1)
 b2 <- matrix(c(0,0,1,1,0),5,1)
 eps <- matrix(rnorm(400),400,1)
 y <- x%*%b1 + (x%*%b2)*eps

 #seleted dimension of central space
 dr.cs <- mave(y~x,method='csmave')
 dr.cs.dim <- mave.dim(dr.cs)

 #seleted dimension of central mean space
 dr.mean <- mave(y~x,method='meanmave')
 dr.mean.dim <- mave.dim(dr.mean)



