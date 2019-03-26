library(WeibullR)


### Name: plot.wblr
### Title: S3 'wblr' Object Plotting on pretty canvax
### Aliases: plot.wblr

### ** Examples

options.wblr(blives=0.1) # make the legend boxes a bit shorter...
da2 <- wblr.conf(wblr.fit(wblr(runif(5,10,100),col="red")))
da3 <- wblr.conf(wblr.fit(wblr(rweibull(5,2,1000),col="green4",pch=3)))
da4 <- wblr.conf(wblr.fit(wblr(rlnorm(5,log(500),log(2)),col="blue3",pch=8),
    dist="lognormal"))
## Not run: 
##D plot.wblr(list(da2,da3,da4),xlim=c(1,1e6),
##D     main="Uniformly distributed observations")
## End(Not run)



