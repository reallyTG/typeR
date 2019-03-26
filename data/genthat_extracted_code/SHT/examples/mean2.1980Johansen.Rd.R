library(SHT)


### Name: mean2.1980Johansen
### Title: Two-sample Test for Multivariate Means by Johansen (1980)
### Aliases: mean2.1980Johansen

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
mean2.1980Johansen(smallX, smallY) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=10)
  Y = matrix(rnorm(50*5), ncol=10)
  
  counter[i] = ifelse(mean2.1980Johansen(X,Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean2.1980Johansen'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




