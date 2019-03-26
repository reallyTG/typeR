library(Compounding)


### Name: pgfDlogarithmicpoisson
### Title: Function pgfDlogarithmicpoisson
### Aliases: pgfDlogarithmicpoisson

### ** Examples

params<-c(.9,7)
pgfDlogarithmicpoisson(.5,params)

## The function is currently defined as

pgfDlogarithmicpoisson <- function(s,params) {
k<-s[abs(s)>1]
if (length(k)>0)
warning("At least one element of the vector s are out of interval [-1,1]")
if (length(params)<2) 
    stop("At least one value in params is missing")
if (length(params)>2) 
    stop("The length of params is 2")
     theta<-params[1]
    lambda<-params[2]
if ((theta>=1)|(theta<=0))
     stop ("Parameter theta belongs to the interval (0,1)")
if (lambda<=0)
     stop ("Parameter lambda must be positive")
   -lambda*(1-theta)/log(theta)*exp(lambda*(s-1))/(1-(1-theta)*exp(lambda*(s-1)))
}



