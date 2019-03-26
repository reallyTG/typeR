library(SHT)


### Name: mean2.ttest
### Title: Two-sample Student's t-test for Univariate Means
### Aliases: mean2.ttest

### ** Examples

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  x = rnorm(57)  # sample x from N(0,1)
  y = rnorm(89)  # sample y from N(0,1)
  
  counter[i] = ifelse(mean2.ttest(x,y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean2.ttest'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




