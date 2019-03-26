library(SHT)


### Name: var2.F
### Title: Two-Sample F-Test for Variance
### Aliases: var2.F

### ** Examples

## CRAN-purpose small example
x = rnorm(10)
y = rnorm(10)
var2.F(x, y, alternative="g") ## Ha : var(x) >= var(y)
var2.F(x, y, alternative="l") ## Ha : var(x) <= var(y)
var2.F(x, y, alternative="t") ## Ha : var(x) =/= var(y)

## No test: 
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  x = rnorm(57)  # sample x from N(0,1)
  y = rnorm(89)  # sample y from N(0,1)
  
  counter[i] = ifelse(var2.F(x,y)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'var2.F'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




