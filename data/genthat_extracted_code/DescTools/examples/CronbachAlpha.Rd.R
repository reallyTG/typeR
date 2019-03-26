library(DescTools)


### Name: CronbachAlpha
### Title: Cronbach's Coefficient Alpha
### Aliases: CronbachAlpha
### Keywords: multivar

### ** Examples

set.seed(1234)
tmp <- data.frame(
  item1 = sample(c(0,1), 20, replace=TRUE),
  item2 = sample(c(0,1), 20, replace=TRUE),
  item3 = sample(c(0,1), 20, replace=TRUE),
  item4 = sample(c(0,1), 20, replace=TRUE),
  item5 = sample(c(0,1), 20, replace=TRUE)
  )

CronbachAlpha(tmp[,1:4], cond=FALSE, conf.level=0.95)
CronbachAlpha(tmp[,1:4], cond=TRUE, conf.level=0.95)

CronbachAlpha(tmp[,1:4], cond=FALSE)
CronbachAlpha(tmp[,1:2], cond=TRUE, conf.level=0.95)

## Not run: 
##D # Calculate bootstrap confidence intervals for CronbachAlpha
##D library(boot)
##D cronbach.boot <- function(data,x) {CronbachAlpha(data[x,])[[3]]}
##D res <- boot(datafile, cronbach.boot, 1000)
##D quantile(res$t, c(0.025,0.975))   # two-sided bootstrapped confidence interval of Cronbach's alpha
##D boot.ci(res, type="bca")          # adjusted bootstrap percentile (BCa) confidence interval (better)
## End(Not run)



