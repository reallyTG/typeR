library(SHT)


### Name: mean2.1931Hotelling
### Title: Two-sample Hotelling's T-squared Test for Multivariate Means
### Aliases: mean2.1931Hotelling

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
mean2.1931Hotelling(smallX, smallY) # run the test

## No test: 
## generate two samples from standard normal distributions.
X = matrix(rnorm(50*5), ncol=5)
Y = matrix(rnorm(77*5), ncol=5)

## run single test
print(mean2.1931Hotelling(X,Y))

## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(50*5), ncol=5)
  Y = matrix(rnorm(77*5), ncol=5)
  
  counter[i] = ifelse(mean2.1931Hotelling(X,Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'mean2.1931Hotelling'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




