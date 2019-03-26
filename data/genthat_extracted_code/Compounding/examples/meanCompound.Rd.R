library(Compounding)


### Name: meanCompound
### Title: function meanCompound
### Aliases: meanCompound

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
parentD<-"beta"
compoundD<-"hypergeometric"
params<-c(3,2,0.5)
meanCompound(parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as

meanCompound <- function(parent,compound,compoundDist,params,...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
    return(momentCompound(1,parent,compound,compoundDist,params,...))
}




