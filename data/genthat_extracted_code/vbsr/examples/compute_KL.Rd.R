library(vbsr)


### Name: compute_KL
### Title: Compute an empirical Kullback Leibler (KL) divergence for an
###   observed distribution of Z-statistics
### Aliases: compute_KL
### Keywords: model fit diagnostic

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
   res<- vbsr(y,X,family="normal",l0_path=seq(-15,-3,length.out=100),post=NULL);
   klRes <- compute_KL(res$z,0.01,1);
   



