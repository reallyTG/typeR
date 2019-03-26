library(CNLTtsa)


### Name: cnlt.spec
### Title: A function to compute CNLT spectral quantities for univariate
###   and bivariate series
### Aliases: cnlt.spec cnlt.spec.SG cnlt.spec.DG
### Keywords: methods

### ** Examples


# read some data in (a bivariate series)

## Not run: 
##D 
##D data(Baidu)
##D data(Google)
##D 
##D BaiGoo<-cnlt.biv(Baidu$Seconds[1:100], Google$Seconds[1:100], Baidu$Return[1:100], 
##D Google$Return[1:100], P = 500)
##D 
##D specobj<-cnlt.spec(BaiGoo,M=10,fact=1.05, Tstar=20)
## End(Not run)




