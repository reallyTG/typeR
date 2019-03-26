library(Compounding)


### Name: pgfIkattitypeh2
### Title: Function pgfIkattitypeh2
### Aliases: pgfIkattitypeh2

### ** Examples

params<-c(.4,9,5,7)
pgfIkattitypeh2(.9,params)


 ## The function is currently defined as
pgfIkattitypeh2 <- function(s,params) {
    xval<-length(s)
    for (i in 1:length(s)) {
        func<-function(x) pgfkattitypeh2(x,params)-s[i]
        xval[i]<-uniroot(func,lower=0,upper=1)$root
    }
    xval
}



