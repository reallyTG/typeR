library(SHT)


### Name: unif.2017YMq
### Title: Multivariate Test of Uniformity based on Normal Quantiles by
###   Yang and Modarres (2017)
### Aliases: unif.2017YMq

### ** Examples

## CRAN-purpose small example
smallX = matrix(runif(10*3),ncol=3)
unif.2017YMq(smallX) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1234
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(runif(50*5), ncol=25)
  counter[i] = ifelse(unif.2017YMq(X)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'unif.2017YMq'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




