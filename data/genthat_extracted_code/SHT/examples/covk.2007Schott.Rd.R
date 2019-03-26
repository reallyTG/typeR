library(SHT)


### Name: covk.2007Schott
### Title: Test for Homogeneity of Covariances by Schott (2007)
### Aliases: covk.2007Schott

### ** Examples

## CRAN-purpose small example
tinylist = list()
for (i in 1:3){ # consider 3-sample case
  tinylist[[i]] = matrix(rnorm(10*3),ncol=3)
}
covk.2007Schott(tinylist) # run the test

## No test: 
## test when k=4 samples with (n,p) = (100,20)
## empirical Type 1 error 
niter   = 1234
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  mylist = list()
  for (j in 1:4){
     mylist[[j]] = matrix(rnorm(100*20),ncol=20)
  }
  
  counter[i] = ifelse(covk.2007Schott(mylist)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'covk.2007Schott'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




