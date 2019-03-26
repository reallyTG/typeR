library(SHT)


### Name: meank.2007Schott
### Title: Test for Equality of Means by Schott (2007)
### Aliases: meank.2007Schott

### ** Examples

## CRAN-purpose small example
tinylist = list()
for (i in 1:3){ # consider 3-sample case
  tinylist[[i]] = matrix(rnorm(10*3),ncol=3)
}
meank.2007Schott(tinylist)

## No test: 
## test when k=5 samples with (n,p) = (10,50)
## empirical Type 1 error 
niter   = 1000
counter = rep(0,niter)  # record p-values
for (i in 1:niter){
  mylist = list()
  for (j in 1:5){
     mylist[[j]] = matrix(rnorm(10*5),ncol=5)
  }
  
  counter[i] = ifelse(meank.2007Schott(mylist)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'meank.2007Schott'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)





