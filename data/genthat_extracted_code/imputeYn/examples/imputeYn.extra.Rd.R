library(imputeYn)


### Name: imputeYn.extra
### Title: Imputing the Last Largest tied Observations with a new method
### Aliases: imputeYn.extra
### Keywords: imputation

### ** Examples

## For Channing House data (heavy censored data)##
## Not run: require(package="boot")
## Not run: time.ch<-channing[1:97,]$time #for male
## Not run: delta.ch<-channing[1:97,]$cens # for male
## Not run: hc.Yn.m<-rep(137,19) # there are 19 last largest censored male each has 137 lifetime
## Not run: 
##D imp.PDQ<-imputeYn.extra(time.ch, delta.ch,  hc.Yn=hc.Yn.m, 
##D   method="it.PDQ", trace=T)
## End(Not run)
## Not run: imp.PDQ

## Not run: 
##D imp.TPQ<-imputeYn.extra(time.ch, delta.ch, hc.Yn=hc.Yn.m, 
##D   method = "km.TPQ", trace=T)
## End(Not run)
## Not run: imp.TPQ



