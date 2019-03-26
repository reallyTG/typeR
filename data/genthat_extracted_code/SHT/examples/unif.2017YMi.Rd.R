library(SHT)


### Name: unif.2017YMi
### Title: Multivariate Test of Uniformity based on Interpoint Distances by
###   Yang and Modarres (2017)
### Aliases: unif.2017YMi

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
unif.2017YMi(smallX) # run the test

## No test: 
## empirical Type 1 error 
##   compare performances of three methods 
niter = 1234
rec1  = rep(0,niter) # for Q1
rec2  = rep(0,niter) #     Q2
rec3  = rep(0,niter) #     Q3
for (i in 1:niter){
  X = matrix(runif(50*10), ncol=50) # (n,p) = (10,50)
  rec1[i] = ifelse(unif.2017YMi(X, type="Q1")$p.value < 0.05, 1, 0)
  rec2[i] = ifelse(unif.2017YMi(X, type="Q2")$p.value < 0.05, 1, 0)
  rec3[i] = ifelse(unif.2017YMi(X, type="Q3")$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'unif.2017YMi'\n\n",
sprintf("* Type 1 error with Q1 : %.4f\n", sum(rec1/niter)),
sprintf("*                   Q2 : %.4f\n", sum(rec2/niter)),
sprintf("*                   Q3 : %.4f\n", sum(rec3/niter)),sep=""))
## End(No test)




