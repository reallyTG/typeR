library(SHT)


### Name: cov1.2012Fisher
### Title: One-sample Test for Covariance Matrix by Fisher (2012)
### Aliases: cov1.2012Fisher

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
cov1.2012Fisher(smallX) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter1 = rep(0,niter)  # p-values of the type 1
counter2 = rep(0,niter)  # p-values of the type 2
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=50) # (n,p) = (5,50)
  counter1[i] = ifelse(cov1.2012Fisher(X, type=1)$p.value < 0.05, 1, 0)
  counter2[i] = ifelse(cov1.2012Fisher(X, type=2)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'cov1.2012Fisher'\n\n",
sprintf("* empirical error with statistic 1 : %.4f\n", sum(counter1/niter)),
sprintf("* empirical error with statistic 2 : %.4f\n", sum(counter2/niter)),sep=""))
## End(No test)




