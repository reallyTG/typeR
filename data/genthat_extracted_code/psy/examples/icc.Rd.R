library(psy)


### Name: icc
### Title: Intraclass correlation coefficient (ICC)
### Aliases: icc
### Keywords: univar

### ** Examples

data(expsy)
icc(expsy[,c(12,14,16)])

#to obtain a 95%confidence interval:
#library(boot)
#icc.boot <- function(data,x) {icc(data[x,])[[7]]}
#res <- boot(expsy[,c(12,14,16)],icc.boot,1000)
#quantile(res$t,c(0.025,0.975))  # two-sided bootstrapped confidence interval of icc (agreement)
#boot.ci(res,type="bca")         # adjusted bootstrap percentile (BCa) confidence interval (better)



