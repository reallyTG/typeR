library(Compounding)


### Name: pgfIneymantypeb
### Title: Function pgfIneymantypeb
### Aliases: pgfIneymantypeb

### ** Examples

params<-c(4,5)
pgfIneymantypeb(.9,params)


##The function is currently defined as

pgfIneymantypeb <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfneymantypeb(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



