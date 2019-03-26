library(SHT)


### Name: mean2.2011LJW
### Title: Two-sample Test for Multivariate Means by Lopes, Jacob, and
###   Wainwright (2011)
### Aliases: mean2.2011LJW

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=10)
smallY = matrix(rnorm(10*3),ncol=10)
mean2.2011LJW(smallX, smallY) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(10*20), ncol=20)
  Y = matrix(rnorm(10*20), ncol=20)
  
  counter[i] = ifelse(mean2.2011LJW(X,Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean2.2011LJW'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




