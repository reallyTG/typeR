library(vbsr)


### Name: vbsr
### Title: fit a linear model with variational Bayes spike penalty
### Aliases: vbsr
### Keywords: models regression

### ** Examples

   n <- 100;
   m <- 500;
   ntrue <- 10;
   e <- rnorm(n);
   X <- matrix(rnorm(n*m),n,m);
   tbeta <- sample(1:m,ntrue);
   beta <- rep(0,m);
   beta[tbeta]<- rnorm(ntrue,0,.3);
   y <- X%*%beta;
   y <- y+e;


   res<- vbsr(y,X,family="normal");



