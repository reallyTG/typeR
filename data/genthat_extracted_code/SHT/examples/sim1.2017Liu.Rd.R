library(SHT)


### Name: sim1.2017Liu
### Title: One-sample Simultaneous Test of Mean and Covariance by Liu et
###   al. (2017)
### Aliases: sim1.2017Liu

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
sim1.2017Liu(smallX) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*10), ncol=10)
  counter[i] = ifelse(sim1.2017Liu(X)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'sim1.2017Liu'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




