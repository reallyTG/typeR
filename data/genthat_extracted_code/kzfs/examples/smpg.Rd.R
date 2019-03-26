library(kzfs)


### Name: smpg
### Title: Smooth and Plot One Dimensional Kolmogorov-Zurbenko Periodogram
### Aliases: smpg kz.smpg
### Keywords: KZ-periodogram

### ** Examples

## Adapted from kzft::kzp example 2
t <- 1:2000
y <- 1.1*sin(2*pi*0.0339*t)+7*sin(2*pi*0.0366*t)+5*rnorm(length(t),0,1)
y[sample(t,100,replace=FALSE)] <- NA

## Not run: 
##D # system.time(op <- kz.smpg(y, dpct=0.0001, rg=c(0.025,0.05),  
##D #		plot=TRUE, log=TRUE, lvl="min", n=10, k=2))
## End(Not run)
op <- kz.smpg(y, dpct=0.0000, f=c(0.0339,0.0366), rg=c(0.025,0.05), 
	n=10, k=2, plot=TRUE, lvl="min", log=FALSE)



