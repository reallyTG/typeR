library(Compounding)


### Name: pgfIhypergeometric
### Title: Function pgfIhypergeometric
### Aliases: pgfIhypergeometric

### ** Examples

params<-c(5,3,.2)
pgfIhypergeometric(.5,params)

## The function is currently defined as

pgfIhypergeometric <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfhypergeometric(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



