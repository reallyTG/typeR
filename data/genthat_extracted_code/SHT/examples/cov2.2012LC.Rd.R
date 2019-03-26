library(SHT)


### Name: cov2.2012LC
### Title: Two-sample Test for High-Dimensional Covariances by Li and Chen
###   (2012)
### Aliases: cov2.2012LC

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
cov2.2012LC(smallX, smallY) # run the test

## No test: 
## comparison of biased and unbiased estimator
## empirical Type 1 error 
niter   = 100
vec.slow = rep(0,niter)  # record p-values
vec.fast = rep(0,niter)
for (i in 1:niter){
  X = matrix(rnorm(500*25), ncol=10)
  Y = matrix(rnorm(500*25), ncol=10)
  
  vec.slow[i] = ifelse(cov2.2012LC(X,Y,unbiased=TRUE)$p.value  < 0.05,1,0)
  vec.fast[i] = ifelse(cov2.2012LC(X,Y,unbiased=FALSE)$p.value < 0.05,1,0)
}

## print the result
cat(paste(
sprintf("* EMPIRICAL TYPE 1 ERROR COMPARISON \n\n"),
sprintf("* Biased   case :  %.3f\n", sum(vec.fast/niter)),
sprintf("* Unbiased case :  %.3f\n", sum(vec.slow/niter)),sep=""))
## End(No test)




