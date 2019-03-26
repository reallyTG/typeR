library(psy)


### Name: lkappa
### Title: Light's kappa for n raters
### Aliases: lkappa
### Keywords: univar

### ** Examples

data(expsy)
lkappa(expsy[,c(11,13,15)])       # Light's kappa for non binary diagnosis
lkappa(expsy[,c(12,14,16)])       # Light's kappa for binary diagnosis
lkappa(expsy[,c(11,13,15)], type="weighted")      # Light's kappa for non binary ordered diagnosis

#to obtain a 95%confidence interval:
#library(boot)
#lkappa.boot <- function(data,x) {lkappa(data[x,], type="weighted")}
#res <- boot(expsy[,c(11,13,15)],lkappa.boot,1000)
#quantile(res$t,c(0.025,0.975))    # Bootstrapped confidence interval of Light's kappa
#boot.ci(res,type="bca")           # adjusted bootstrap percentile (BCa) confidence interval (better)



