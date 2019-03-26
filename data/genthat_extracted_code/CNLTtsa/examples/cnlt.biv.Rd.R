library(CNLTtsa)


### Name: cnlt.biv
### Title: Performs 'nondecimated' complex-valued wavelet lifting for
###   bivariate time series analysis
### Aliases: cnlt.biv
### Keywords: methods

### ** Examples


# a bivariate series example with same grids

# simulate data, e.g. two sinusoids
dat <- seq(from=1, to=3, by=0.1)
x1 <- cumsum(sample(dat, 200, TRUE))

y1 <-sin(2*pi*(1/25)*x1) + sin(2*pi*(1/50)*x1)+ 1*sin(2*pi*(1/10)*x1)+ rnorm(length(x1), 0,0.2)
y3 <- c(sin(2*pi*(1/25)*x1[1:100]),sin(2*pi*(1/25)*x1[97:196]))+ rnorm(length(x1), 0,0.1)

## Not run: 
##D y1y3.dec<-cnlt.biv(x1, f1=y1, f2=y3, P = 500)
##D 
##D # the complex detail coefficients corresponding to the first timepoint are:
##D 
##D y1y3.dec$det1[[1]]
##D 
## End(Not run)

# a bivariate series example with different grids

# load some data in

data(Baidu)
data(Google)

## Not run: 
##D BaiGoo<-cnlt.biv(Baidu$Seconds[1:100], Google$Seconds[1:100], Baidu$Return[1:100], 
##D Google$Return[1:100], P = 500)
##D 
##D # now look at some of the coefficients from the decomposition
##D # (the complex detail coefficients corresponding to the first timepoint:
##D 
##D BaiGoo$det1[[1]]
##D BaiGoo$det2[[1]]
## End(Not run)




