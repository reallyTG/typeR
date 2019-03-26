library(Hmisc)


### Name: hdquantile
### Title: Harrell-Davis Distribution-Free Quantile Estimator
### Aliases: hdquantile
### Keywords: univar

### ** Examples

set.seed(1)
x <- runif(100)
hdquantile(x, (1:3)/4, se=TRUE)

## Not run: 
##D # Compare jackknife standard errors with those from the bootstrap
##D library(boot)
##D boot(x, function(x,i) hdquantile(x[i], probs=(1:3)/4), R=400)
## End(Not run)



