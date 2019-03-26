library(SHT)


### Name: meank.2009ZX
### Title: Test for Equality of Means by Zhang and Xu (2009)
### Aliases: meank.2009ZX

### ** Examples

## CRAN-purpose small example
tinylist = list()
for (i in 1:3){ # consider 3-sample case
  tinylist[[i]] = matrix(rnorm(10*3),ncol=3)
}
meank.2009ZX(tinylist) # run the test

## No test: 
## test when k=5 samples with (n,p) = (100,20)
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  mylist = list()
  for (j in 1:5){
     mylist[[j]] = matrix(rnorm(100*10),ncol=10)
  }
  
  counter[i] = ifelse(meank.2009ZX(mylist, method="L")$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'meank.2009ZX'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)





