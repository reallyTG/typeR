library(ECFsup)


### Name: RcppArmadillo-Functions
### Title: Set of functions in ECPsup package
### Aliases: rcpparma_L2stat rcpparma_fKSCovL2 rcpparma_maxstat
###   rcpparma_fKSCovsup

### ** Examples

  vn <- c(20,30,30); k <- length(vn); n <- sum(vn);
  p <- 100; Nsim <- 500;
  datamx <- matrix(rnorm(p*n),p,n,Nsim);
  rcpparma_fKSCovL2(datamx,vn,k,p,n,Nsim);
  rcpparma_fKSCovsup(datamx,vn,k,p,n,Nsim);



