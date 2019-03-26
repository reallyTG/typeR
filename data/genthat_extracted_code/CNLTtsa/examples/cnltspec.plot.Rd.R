library(CNLTtsa)


### Name: cnltspec.plot
### Title: A function to plot CNLT spectral quantities of interest
### Aliases: cnltspec.plot
### Keywords: dplot

### ** Examples


# simulate data, e.g. two sinusoids
dat <- seq(from=1, to=3, by=0.1)
x1 <- cumsum(sample(dat, 200, TRUE)) 

y1 <-sin(2*pi*(1/25)*x1) + sin(2*pi*(1/50)*x1)+ 1*sin(2*pi*(1/10)*x1)+ rnorm(length(x1), 0,0.2)
y3 <- c(sin(2*pi*(1/25)*x1[1:100]),sin(2*pi*(1/25)*x1[97:196]))+ rnorm(length(x1), 0,0.1)

## Not run: 
##D 
##D y1y3.dec<-cnlt.biv(x1, f1=y1, f2=y3, P = 500)
##D 
##D y1y3spec<-cnlt.spec(y1y3.dec)
##D 
##D cnltspec.plot(y1y3spec$coh,y1y3spec$mtime,y1y3spec$mscale)
## End(Not run)




