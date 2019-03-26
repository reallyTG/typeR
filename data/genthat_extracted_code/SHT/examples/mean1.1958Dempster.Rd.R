library(SHT)


### Name: mean1.1958Dempster
### Title: One-sample Test for Mean Vector by Dempster (1958, 1960)
### Aliases: mean1.1958Dempster

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
mean1.1958Dempster(smallX) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=50)
  counter[i] = ifelse(mean1.1958Dempster(X)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean1.1958Dempster'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




