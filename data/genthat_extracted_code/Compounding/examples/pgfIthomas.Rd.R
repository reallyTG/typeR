library(Compounding)


### Name: pgfIthomas
### Title: Function pgfIthomas
### Aliases: pgfIthomas

### ** Examples

params<-c(5,.4)
pgfIthomas(.9,params)


## The function is currently defined as

pgfIthomas <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfthomas(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    print(xval)
    xval
}




