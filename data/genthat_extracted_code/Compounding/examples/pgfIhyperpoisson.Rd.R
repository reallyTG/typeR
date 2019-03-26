library(Compounding)


### Name: pgfIhyperpoisson
### Title: Function pgfIhyperpoisson
### Aliases: pgfIhyperpoisson

### ** Examples

params<-c(.7,3)
pgfIhyperpoisson(.9,params)

##The function is currently defined as

pgfIhyperpoisson <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfhyperpoisson(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



