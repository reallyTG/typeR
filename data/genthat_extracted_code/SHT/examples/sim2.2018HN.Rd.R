library(SHT)


### Name: sim2.2018HN
### Title: Two-sample Simultaneous Test of Means and Covariances by Hyodo
###   and Nishiyama (2018)
### Aliases: sim2.2018HN

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
sim2.2018HN(smallX, smallY) # run the test

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  X = matrix(rnorm(121*10), ncol=10)
  Y = matrix(rnorm(169*10), ncol=10)
  counter[i] = ifelse(sim2.2018HN(X,Y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'sim2.2018HN'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




