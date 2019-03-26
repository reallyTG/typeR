library(SHT)


### Name: useknd
### Title: Apply k-sample tests for two multivariate samples
### Aliases: useknd

### ** Examples

## No test: 
## use 'covk.2007Schott' for two-sample covariance testing
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=10)
  Y = matrix(rnorm(50*5), ncol=10)
  
  counter[i] = ifelse(useknd(X,Y,"covk.2007Schott")$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example using 'covk.2007Schott'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




