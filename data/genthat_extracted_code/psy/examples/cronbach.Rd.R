library(psy)


### Name: cronbach
### Title: Cronbach's coefficient alpha
### Aliases: cronbach
### Keywords: univar

### ** Examples

data(expsy)
cronbach(expsy[,1:10])  ## not good because item 2 is reversed (1 is high and 4 is low)
cronbach(cbind(expsy[,c(1,3:10)],-1*expsy[,2]))  ## better

#to obtain a 95%confidence interval:
#datafile <- cbind(expsy[,c(1,3:10)],-1*expsy[,2])
#library(boot)
#cronbach.boot <- function(data,x) {cronbach(data[x,])[[3]]}
#res <- boot(datafile,cronbach.boot,1000)
#quantile(res$t,c(0.025,0.975))  ## two-sided bootstrapped confidence interval of Cronbach's alpha
#boot.ci(res,type="bca")         ## adjusted bootstrap percentile (BCa) confidence interval (better)



