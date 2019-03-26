library(Compounding)


### Name: pgfIyule
### Title: Function pgfIyule
### Aliases: pgfIyule

### ** Examples

params<-.3
pgfIyule(.9,params)


## The function is currently defined as

pgfIyule <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfyule(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}




