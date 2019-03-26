library(SHT)


### Name: var1.chisq
### Title: One-Sample Chi-Square Test for Variance
### Aliases: var1.chisq

### ** Examples

## CRAN-purpose small example
x = rnorm(10)
var1.chisq(x, alternative="g") ## Ha : var(x) >= 1
var1.chisq(x, alternative="l") ## Ha : var(x) <= 1
var1.chisq(x, alternative="t") ## Ha : var(x) =/=1

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  x = rnorm(50)  # sample x from N(0,1)
  
  counter[i] = ifelse(var1.chisq(x,var0=1)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'var1.chisq'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




