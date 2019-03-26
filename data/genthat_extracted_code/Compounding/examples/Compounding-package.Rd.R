library(Compounding)


### Name: Compounding-package
### Title: Calculation of the main characteristics of compounding
###   distribution.
### Aliases: Compounding-package
### Keywords: package

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
parentD<-"exp"
compoundD<-"poisson"
params<-2.5
x<-0.5
k<-2
dCompound(x,parentD,compoundD,compoundDist,params)
qCompound(x,parentD,compoundD,compoundDist,params)
hCompound(x,parentD,compoundD,compoundDist,params)
momentCompound(k, parentD, compoundD, compoundDist,params)



