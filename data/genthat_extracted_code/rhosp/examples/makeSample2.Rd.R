library(rhosp)


### Name: makeSample2
### Title: create a sample of the second model stored in a file
### Aliases: makeSample2
### Keywords: file

### ** Examples


arg1ExpMod2<-list(rangen=rexp,nbparam=1,param=list(1/2));
arg1BinMod2<-list(rangen=rbinom,nbparam=2,param=list(1,1/20));
arg1UnifMod2<-list(rangen=runif,nbparam=2,param=list(0,20));
arg1LnormMod2<-list(rangen=rlnorm,nbparam=2,param=list(1/4,1));

arg2ExpMod2<-list(rangen=rexp,nbparam=1,param=list(1/5));
# arg2-cst<-list(rangen=pcst<-function(x,p) p ,nbparam=1,param=list(1/10));
arg2GammaMod2<-list(rangen=rgamma,nbparam=2,param=list(3,1/5));


makeSample2("thedata.rda",200,arg1ExpMod2,arg2ExpMod2)




