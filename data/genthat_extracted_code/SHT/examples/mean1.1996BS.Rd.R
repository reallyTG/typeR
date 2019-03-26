library(SHT)


### Name: mean1.1996BS
### Title: One-sample Test for Mean Vector by Bai and Saranadasa (1996)
### Aliases: mean1.1996BS

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
mean1.1996BS(smallX) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=25)
  counter[i] = ifelse(mean1.1996BS(X)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean1.1996BS'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




