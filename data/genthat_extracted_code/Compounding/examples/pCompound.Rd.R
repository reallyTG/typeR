library(Compounding)


### Name: pCompound
### Title: function pCompound
### Aliases: pCompound

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
q<-0.5
parentD<-"beta"
compoundD<-"hypergeometric"
params<-c(3,2,0.5)
pCompound(q,parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as

pCompound <- function(q,parent,compound,compoundDist,params,...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
    xval <- real(length(q))
    F <- get(paste("p",parent,sep=""), mode = "function")
    phi <- get(paste("pgf",compound,sep=""), mode = "function")
    xval <- (1-phi(1-F(q,...),params))/(1-phi(0,params))
    return(xval)
}



