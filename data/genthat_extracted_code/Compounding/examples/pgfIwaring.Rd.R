library(Compounding)


### Name: pgfIwaring
### Title: Function pgfIwaring
### Aliases: pgfIwaring

### ** Examples

params<-c(.8,.4)
pgfIwaring(.9,params)

## The function is currently defined as

pgfIwaring <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfwaring(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



