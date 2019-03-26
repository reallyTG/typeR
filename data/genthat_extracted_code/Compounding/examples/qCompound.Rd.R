library(Compounding)


### Name: qCompound
### Title: function qCompound
### Aliases: qCompound

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
p<-0.5
parentD<-"beta"
compoundD<-"hypergeometric"
params<-c(3,2,0.5)
qCompound(p,parentD,compoundD,params,shape1=2,shape2=0.3)

## The function is currently defined as
qCompound <- function(p,parent,compound,compoundDist,params,...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }

    l<-p[p<0|p>1]
    if (length(l)>0) stop("Parameter p is probability") 

    xval <- real(length(p))
    Finv <- get(paste("q", parent, sep = ""), mode = "function")
    phi <- get(paste("pgf", compound, sep = ""), mode = "function")
    phiInv <- get(paste("pgfI", compound, sep = ""), mode = "function")
    xval <- Finv(1-phiInv(1-p*(1-phi(0,params)),params),...)
    return(xval)
}



