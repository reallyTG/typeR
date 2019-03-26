library(CNLTtsa)


### Name: cnlt.univ
### Title: Performs 'nondecimated' complex-valued wavelet lifting for
###   univariate time series analysis
### Aliases: cnlt.univ
### Keywords: methods

### ** Examples


x<-sort(runif(100))

y <-sin(2*pi*(1/25)*x) + sin(2*pi*(1/50)*x)

## Not run: 
##D xy.dec<-cnlt.univ(x,y,P=300)
##D 
##D xy.dec$det[[1]][1:10]
## End(Not run)




