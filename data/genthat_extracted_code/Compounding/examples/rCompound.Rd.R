library(Compounding)


### Name: rCompound
### Title: function rCompound
### Aliases: rCompound

### ** Examples

compoundDist <- c("geometric","poisson","negativebinomial","binomial",
"logarithmic","binomialbinomial","binomialpoisson",
"poissonbinomial","neymantypea","polyaaeppli",
"poissonpascal","pascalpoisson",
"logarithmicbinomial","logarithmicpoisson",
"poissonlindley",
"hyperpoisson","yule","waring","kattitypeh1",
"kattitypeh2","neymantypeb","neymantypec",
"hypergeometric","thomas")
n<-5
parentD<-"beta"
compoundD<-"hypergeometric"
params<-c(3,2,0.5)
rCompound(n,parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as
rCompound <- function(n, parent, compound,params, ...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
    if (n<0)
     stop("Parameter n must be positive")
 if(!(abs(n-round(n))<.Machine$double.eps^0.5))
stop("Parameter n must be positive integer")

    zval <- runif(n)
    xval <- qCompound(zval,parent,compound,compoundDist,params,...)
    return(xval)
}



