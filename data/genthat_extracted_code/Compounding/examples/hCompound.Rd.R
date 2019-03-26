library(Compounding)


### Name: hCompound
### Title: function hCompound
### Aliases: hCompound

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
hCompound(q,parentD,compoundD,compoundDist,params,shape1=2,shape2=0.3)

## The function is currently defined as
hCompound <- function(x, parent, compound,params, ...) {
    if (!exists(paste("p",parent,sep=""))) {
        return(paste("The parent distribution",parent,"doesn't exist"))
    }
    if (!is.element(compound,compoundDist)) {
        return(paste("The discrete distribution",compound,"doesn't exist"))
    }
    dCompound(x,parent,compound,compoundDist,params,...)/(1-pCompound(x,parent,compound,
    compoundDist,params,...))
}




