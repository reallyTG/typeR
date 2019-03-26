library(SHT)


### Name: meank.anova
### Title: Analysis of Variance for Equality of Means
### Aliases: meank.anova

### ** Examples

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
  
  counter[i] = ifelse(meank.anova(mylist)$p.value < 0.05, 1, 0)
}

## print the result
cat(paste("\n* Example for 'meank.anova'\n\n",
sprintf("* number of rejections   : %d\n",sum(counter)),
sprintf("* total number of trials : %d\n",niter),
sprintf("* empirical Type 1 error : %.4f\n", sum(counter/niter)),sep=""))
## End(No test)




