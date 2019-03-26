library(GLDEX)


### Name: fun.plot.fit.bm
### Title: Plotting mixture of two generalised lambda distributions on the
###   data set.
### Aliases: fun.plot.fit.bm
### Keywords: hplot

### ** Examples


# par(mfrow=c(2,1))

## Fitting mixture of generalised lambda distributions on the data set using 
## both the maximum likelihood and partition maximum likelihood and plot 
## the resulting fits

# junk<-fun.auto.bimodal.ml(faithful[,1],per.of.mix=0.1,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1,5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# name="Maximum likelihood using",xlab="faithful1",param.vec=c("rs","fmkl"))

# junk<-fun.auto.bimodal.pml(faithful[,1],clustering.m=clara,init1.sel="rprs",
# init2.sel="rmfmkl",init1=c(-1.5,1,5),init2=c(-0.25,1.5),leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# name="Partition maximum likelihood using",xlab="faithful1",
# param.vec=c("rs","fmkl"))

# junk<-fun.auto.bimodal.ml(faithful[,1],per.of.mix=0.1,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1,5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# main="Mixture distribution fit",
# name="RS and FMKL GLD",xlab="faithful1",param.vec=c("rs","fmkl"))




