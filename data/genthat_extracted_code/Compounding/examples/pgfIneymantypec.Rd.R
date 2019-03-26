library(Compounding)


### Name: pgfIneymantypec
### Title: Function pgfIneymantypec
### Aliases: pgfIneymantypec

### ** Examples

params<-c(4,5)
pgfIneymantypec(.9,params)

## The function is currently defined as

pgfIneymantypec <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfneymantypec(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



