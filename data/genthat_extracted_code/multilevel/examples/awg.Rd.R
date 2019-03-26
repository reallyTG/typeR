library(multilevel)


### Name: awg
### Title: Brown and Hauenstein (2005) awg agreement index
### Aliases: awg
### Keywords: attribute

### ** Examples

data(lq2002)

#Examples for multiple item scales
awg.out<-awg(lq2002[,3:13],lq2002$COMPID,range=c(1,5))
summary(awg.out)

#Example for single item measure
awg.out<-awg(lq2002$LEAD05,lq2002$COMPID,range=c(1,5))
summary(awg.out)



