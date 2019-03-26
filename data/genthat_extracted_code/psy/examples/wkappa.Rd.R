library(psy)


### Name: wkappa
### Title: weighted Kappa for 2 raters
### Aliases: wkappa
### Keywords: univar

### ** Examples

data(expsy)
wkappa(expsy[,c(11,13)])        # weighted kappa (squared weights)

#to obtain a 95%confidence interval:
#library(boot)
#wkappa.boot <- function(data,x) {wkappa(data[x,])[[3]]}
#res <- boot(expsy[,c(11,13)],wkappa.boot,1000)
#quantile(res$t,c(0.025,0.975))  # two-sided bootstrapped confidence interval of weighted kappa
#boot.ci(res,type="bca")         # adjusted bootstrap percentile (BCa) confidence interval (better)



