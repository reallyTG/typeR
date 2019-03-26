library(SHT)


### Name: eqdist.2014BG
### Title: Test for Equality of Two Distributions by Biswas and Ghosh
###   (2014)
### Aliases: eqdist.2014BG

### ** Examples

## CRAN-purpose small example
smallX = matrix(rnorm(10*3),ncol=3)
smallY = matrix(rnorm(10*3),ncol=3)
eqdist.2014BG(smallX, smallY) # run the test

## No test: 
## compare asymptotic and permutation-based powers
set.seed(777)
ntest  = 1000
pval.a = rep(0,ntest)
pval.p = rep(0,ntest)

for (i in 1:ntest){
  x = matrix(rnorm(100), nrow=5)
  y = matrix(rnorm(100), nrow=5)
  
  pval.a[i] = ifelse(eqdist.2014BG(x,y,method="a")$p.value<0.05,1,0)
  pval.p[i] = ifelse(eqdist.2014BG(x,y,method="p",nreps=100)$p.value <0.05,1,0)
}

## print the result
cat(paste(
sprintf("\n* EMPIRICAL TYPE 1 ERROR COMPARISON \n"),
sprintf("* Asymptotics :  %.3f\n", sum(pval.a/ntest)),
sprintf("* Permutation :  %.3f\n", sum(pval.p/ntest)),sep=""))
## End(No test)




