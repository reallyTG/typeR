library(BWStest)


### Name: murakami_cdf
### Title: Murakami test statistic distribution.
### Aliases: murakami_cdf

### ** Examples


# basic usage:
xv <- seq(0,4,length.out=101)
yv <- murakami_cdf(xv, n1=8, n2=6, flavor=1L)
plot(xv,yv)
zv <- bws_cdf(xv)
lines(xv,zv,col='red')

# check under the null:
## Not run: 
##D flavor <- 1L
##D n1 <- 8
##D n2 <- 8
##D set.seed(1234)
##D Bvals <- replicate(2000,murakami_stat(rnorm(n1),rnorm(n2),flavor))
##D # should be uniform:
##D plot(ecdf(murakami_cdf(Bvals,n1,n2,flavor)))
## End(Not run)




