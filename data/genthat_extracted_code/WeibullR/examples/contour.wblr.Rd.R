library(WeibullR)


### Name: contour.wblr
### Title: S3 Likelihood Ratio Contour Maps From 'wblr' Objects
### Aliases: contour.wblr

### ** Examples

set.seed(1234)
da2 <- wblr.conf(wblr.fit(wblr(runif(5,100,1000),col="red")))
da3 <- wblr.conf(wblr.fit(wblr(rweibull(5,3,1000),col="green4")))

## Not run: 
##D contour.wblr(list(da2,da3))
## End(Not run)



