library(Compounding)


### Name: pgfIkattitypeh1
### Title: Function pgfIkattitypeh1
### Aliases: pgfIkattitypeh1

### ** Examples

params<-c(.4,9,5)
pgfIkattitypeh1(.9,params)


## The function is currently defined as

pgfIkattitypeh1 <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfkattitypeh1(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



