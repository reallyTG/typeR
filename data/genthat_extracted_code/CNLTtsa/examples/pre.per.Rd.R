library(CNLTtsa)


### Name: pre.per
### Title: Functions to form periodogram objects with a common time and
###   scale bins for bivariate series with different sampling grids for
###   each component
### Aliases: pre.per pre.per.sample pre.per.comb
### Keywords: methods

### ** Examples


# simulate data, e.g. two sinusoids
dat <- seq(from=1, to=3, by=0.1)
x1 <- cumsum(sample(dat, 200, TRUE))
x2 <- cumsum(sample(dat, 200, TRUE))

y1 <-sin(2*pi*(1/25)*x1) + sin(2*pi*(1/50)*x1)+ 1*sin(2*pi*(1/10)*x1)+ rnorm(length(x1), 0,0.2)
y3 <- sin(2*pi*(1/25)*x2[97:196]) + rnorm(length(x2), 0,0.1)

## Not run: 
##D y1y3.dec<-cnlt.biv(x1, f1=y1, f2=y3, P = 500)
##D 
##D # compute the co-periodogram for the first component...
##D 
##D C1 <- pre.per(x1, sapply(y1y3.dec$det1,Re), y1y3.dec$lre1, y1y3.dec$lreA1, Jstar = 10)
##D 
##D # .. and for the second component
##D C2 <- pre.per(x1, sapply(y1y3.dec$det2,Re), y1y3.dec$lre2, y1y3.dec$lreA2, Jstar = 10)
## End(Not run)




