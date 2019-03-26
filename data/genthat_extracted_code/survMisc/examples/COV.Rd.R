library(survMisc)


### Name: COV
### Title: *cov*ariance matrix for survival data
### Aliases: COV COV.ten COV.stratTen COV.numeric
### Keywords: survival

### ** Examples

## Two covariate groups
## K&M. Example 7.2, pg 210, table 7.2 (last column).
## Not run: 
##D data("kidney", package="KMsurv")
##D k1 <- with(kidney,
##D            ten(Surv(time=time, event=delta) ~ type))
##D COV(k1)[COV(k1) > 0]
## End(Not run)
## Four covariate groups
## K&M. Example 7.6, pg 217.
## Not run: 
##D data("larynx", package="KMsurv")
##D l1 <- ten(Surv(time, delta) ~ stage, data=larynx)
##D rowSums(COV(l1), dims=2)
## End(Not run)
## example of numeric method
## Three covariate groups
## K&M. Example 7.4, pg 212.
## Not run: 
##D data("bmt", package="KMsurv")
##D b1 <- asWide(ten(Surv(time=t2, event=d3) ~ group, data=bmt))
##D rowSums(b1[, COV(x=e, n=n, ncg=matrix(data=c(n_1, n_2, n_3), ncol=3))], dims=2)
## End(Not run)



