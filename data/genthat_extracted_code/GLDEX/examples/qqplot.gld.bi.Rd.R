library(GLDEX)


### Name: qqplot.gld.bi
### Title: Do a quantile plot on the bimodal distribution fits.
### Aliases: qqplot.gld.bi
### Keywords: hplot

### ** Examples

# set.seed(1000)

# junk<-rweibull(300,3,2)

## Fitting mixture of generalised lambda distributions on the data set using 
## both the maximum likelihood and partition maximum likelihood and plot the 
## resulting fits
# junk<-fun.auto.bimodal.ml(faithful[,1],per.of.mix=0.1,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1.5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# name="Maximum likelihood using",xlab="faithful1",param.vec=c("rs","fmkl"))

## Do a quantile plot on the raw quantiles
# qqplot.gld.bi(faithful[,1],junk$par,param1="rs",param2="fmkl",
# name="RS FMKL ML fit")

## Or a qq plot to examine deviation from straight line
# qqplot.gld.bi(faithful[,1],junk$par,param1="rs",param2="fmkl",
# name="RS FMKL ML fit",type="str.qqplot")



