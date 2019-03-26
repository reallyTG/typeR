library(SHT)


### Name: mean2.1996BS
### Title: Two-sample Test for High-Dimensional Means by Bai and Saranadasa
###   (1996)
### Aliases: mean2.1996BS

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
mean2.1996BS(smallX, smallY) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=10)
  Y = matrix(rnorm(50*5), ncol=10)
  
  counter[i] = ifelse(mean2.1996BS(X,Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean2.1996BS'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




