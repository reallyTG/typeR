library(Compounding)


### Name: pgfIpoissonlindley
### Title: Function pgfIpoissonlindley
### Aliases: pgfIpoissonlindley

### ** Examples

params<-5
pgfIpoissonlindley(.9,params)


## The function is currently defined as

pgfIpoissonlindley <- function(s,params) {
    xval<-length(s)
    theta<-params[1]
    for (i in 1:length(s)) {
        func<-function(x) pgfpoissonlindley(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



