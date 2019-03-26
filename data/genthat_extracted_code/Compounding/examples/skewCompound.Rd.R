library(Compounding)


### Name: skewCompound
### Title: function skewCompound
### Aliases: skewCompound

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
skewCompound(parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as
skewCompound <- function(parent,compound,params,...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
   m1 <- meanCompound(parent,compound,compoundDist,params,...)
   m3 <- momentCompound(3,parent,compound,compoundDist,params,...)
   sig2 <- varCompound(parent,compound,compoundDist,params,...)
   return((m3-3*m1*sig2-m1^3)/sig2^(3/2))
}



