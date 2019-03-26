library(gap)


### Name: qqfun
### Title: Quantile-comparison plots
### Aliases: qqfun
### Keywords: distribution univar regression

### ** Examples

## Not run: 
##D p <- runif(100)
##D alpha <- 1/log(10)
##D qqfun(p,dist="unif")
##D qqfun(-log10(p),dist="exp",rate=alpha,pch=21)
##D 
##D #library(car)
##D #qq.plot(p,dist="unif")
##D #qq.plot(-log10(p),dist="exp",rate=alpha)
##D 
##D #library(lattice)
##D #qqmath(~ -log10(p), distribution = function(p) qexp(p,rate=alpha))
## End(Not run)



