library(SHT)


### Name: cov1.2015WL
### Title: One-sample Test for Covariance Matrix by Wu and Li (2015)
### Aliases: cov1.2015WL

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
cov1.2015WL(smallX) # run the test

## No test: 
## empirical Type 1 error 
##   compare effects of m=5, 10, 50
niter = 1000
rec1  = rep(0,niter) # for m=5
rec2  = rep(0,niter) #     m=10
rec3  = rep(0,niter) #     m=50
for (i in 1:niter){
  X = matrix(rnorm(50*10), ncol=50) # (n,p) = (10,50)
  rec1[i] = ifelse(cov1.2015WL(X, m=5)$p.value < 0.05, 1, 0)
  rec2[i] = ifelse(cov1.2015WL(X, m=10)$p.value < 0.05, 1, 0)
  rec3[i] = ifelse(cov1.2015WL(X, m=50)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'cov1.2015WL'\n\n",
sprintf("* Type 1 error with m=5  : %.4f\n", sum(rec1/niter)),
sprintf("*                   m=10 : %.4f\n", sum(rec2/niter)),
sprintf("*                   m=50 : %.4f\n", sum(rec3/niter)),sep=""))
## End(No test)




