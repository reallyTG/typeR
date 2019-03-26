library(psy)


### Name: ckappa
### Title: Cohen's Kappa for 2 raters
### Aliases: ckappa
### Keywords: univar

### ** Examples
data(expsy)
ckappa(expsy[,c(12,14)])          # Cohen's kappa for binary diagnosis

#to obtain a 95%confidence interval:
#library(boot)
#ckappa.boot <- function(data,x) {ckappa(data[x,])[[2]]}
#res <- boot(expsy[,c(12,14)],ckappa.boot,1000)
#quantile(res$t,c(0.025,0.975))    # two-sided bootstrapped confidence interval of kappa
#boot.ci(res,type="bca")           # adjusted bootstrap percentile (BCa) confidence interval (better)
#ckappa(expsy[,c(11,13)])          # Cohen's kappa for non binary diagnosis



