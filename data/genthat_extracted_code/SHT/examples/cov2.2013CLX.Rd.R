library(SHT)


### Name: cov2.2013CLX
### Title: Two-sample Test for Covariance Matrices by Cai, Liu, and Xia
###   (2013)
### Aliases: cov2.2013CLX

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
cov2.2013CLX(smallX, smallY) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=10)
  Y = matrix(rnorm(50*5), ncol=10)
  
  counter[i] = ifelse(cov2.2013CLX(X, Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'cov2.2013CLX'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




