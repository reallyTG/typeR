library(Compounding)


### Name: pgfDbinomialbinomial
### Title: Function pgfDbinomialbinomial
### Aliases: pgfDbinomialbinomial

### ** Examples

params<-c(.4,.9,5,7)
pgfDbinomialbinomial(.5,params)


## The function is currently defined as

pgfDbinomialbinomial <- function(s,params) {
k<-s[abs(s)>1]
if (length(k)>0)
    warning("At least one element of the vector s are out of interval [-1,1]")
if (length(params)<4) 
    stop("At least one value in params is missing")
if (length(params)>4) 
    stop("The length of params is 4")
    p1<-params[1]
    p2<-params[2]
    m<-params[3]
    n<-params[4]
if ((p1>=1)|(p1<=0))
    stop ("Parameter p1 belongs to the interval (0,1)")
if ((p2>=1)|(p2<=0))
    stop ("Parameter p2 belongs to the interval (0,1)")
if (m<0)
    stop("Parameter m must be positive integer")
if (n<0)
     stop("Parameter n must be positive")
 if(!(abs(n-round(n))<.Machine$double.eps^0.5))
stop("Parameter n must be positive integer")
    m*n*p1*p2*(1-p2+p2*s)^(n-1)*(1-p1+p1*(1-p2+p2*s)^n)^(m-1)
}



