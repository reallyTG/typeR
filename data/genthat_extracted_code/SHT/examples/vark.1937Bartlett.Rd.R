library(SHT)


### Name: vark.1937Bartlett
### Title: Bartlett's Test for Homogeneity of Variance
### Aliases: vark.1937Bartlett

### ** Examples

## CRAN-purpose small example
small1d = list()
for (i in 1:5){ # k=5 sample
  small1d[[i]] = rnorm(20)
}
vark.1937Bartlett(small1d) # run the test

## No test: 
## test when k=5 (samples)
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  mylist = list()
  for (j in 1:5){
     mylist[[j]] = rnorm(50)   
  }
  
  counter[i] = ifelse(vark.1937Bartlett(mylist)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'vark.1937Bartlett'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




