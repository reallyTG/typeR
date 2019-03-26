library(rhosp)


### Name: makeSample
### Title: create a sample of the first model stored in a file
### Aliases: makeSample
### Keywords: file

### ** Examples

arg1Exp<-list(rangen=rexp,nbparam=1,param=list(1/3));

arg2Exp<-list(disfun=pexp,nbparam=1,param=list(1/5));

makeSample("mydata.rda",200,arg1Exp,arg2Exp)



