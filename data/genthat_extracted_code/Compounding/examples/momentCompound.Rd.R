library(Compounding)


### Name: momentCompound
### Title: function momentCompound
### Aliases: momentCompound

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
k<-3
parentD<-"beta"
compoundD<-"hypergeometric"
params<-c(3,2,0.5)
momentCompound(k,parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as
function(k, parent, compound, compoundDist,params, ...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
    Finv <- get(paste("q", parent, sep = ""), mode = "function")
    phi <- get(paste("pgf",compound,sep=""), mode = "function")
    phiD <- get(paste("pgfD",compound,sep=""), mode = "function")
    fint <- function(x) phiD(1-x,params)*(Finv(x,...))^k/(1-phi(0,params))
    return(integrate(fint,lower=0,upper=1)$value)
}




