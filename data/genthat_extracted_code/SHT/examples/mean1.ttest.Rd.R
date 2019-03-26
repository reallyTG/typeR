library(SHT)


### Name: mean1.ttest
### Title: One-sample Student's t-test for Univariate Mean
### Aliases: mean1.ttest

### ** Examples

## empirical Type 1 error 
niter   = 100
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  x = rnorm(10)         # sample from N(0,1)
  counter[i] = ifelse(mean1.ttest(x)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean1.ttest'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))




