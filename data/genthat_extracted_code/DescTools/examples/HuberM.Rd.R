library(DescTools)


### Name: HuberM
### Title: Safe (generalized) Huber M-Estimator of Location
### Aliases: HuberM
### Keywords: univar robust

### ** Examples

HuberM(c(1:9, 1000))
mad   (c(1:9, 1000))

set.seed(7)
x <- c(round(rnorm(1000), 1), round(rnorm(50, m=10, sd = 10)))
HuberM(x, conf.level=0.95)


## Not run: 
##D 
##D # scale zero
##D HuberM(rep(9, 100))
##D mad   (rep(9, 100))
##D 
##D # bootstrap confidence intervals
##D HuberM(x, conf.level=0.95, ci.type="boot")
## End(Not run)
 



