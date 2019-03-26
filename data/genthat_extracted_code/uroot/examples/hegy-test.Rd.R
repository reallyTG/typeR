library(uroot)


### Name: hegy.test
### Title: Hylleberg, Engle, Granger and Yoo Test for Seasonal Unit Roots
### Aliases: hegy.test hegy.regressors hegy.print hegy.residuals
###   hegy.summary
### Keywords: ts

### ** Examples

x <- bgt.data[["LCONSEXPCO"]]
hegy.test(x, deterministic = c(1,1,1), lag.method = "fixed", maxlag = 1)

## Not run: 
##D # this requires CUDA capable GPU
##D hegy.test(x, deterministic = c(1,1,1), lag.method = "fixed", maxlag = 1, 
##D   pvalue = "bootstrap")
## End(Not run)



