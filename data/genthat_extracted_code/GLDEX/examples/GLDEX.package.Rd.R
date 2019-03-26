library(GLDEX)


### Name: GLDEX-package
### Title: This package fits RS and FMKL generalised lambda distributions
###   using various methods. It also provides functions for fitting bimodal
###   distributions using mixtures of generalised lambda distributions.
### Aliases: GLDEX-package GLDEX
### Keywords: distribution smooth

### ** Examples


#### Univariate distributions example:

set.seed(1000)

junk<-rweibull(300,3,2)

### A faster ML estimtion 

# junk.fit1<-fun.RMFMKL.ml.m(junk)
# junk.fit2<-fun.RPRS.ml.m(junk)

# qqplot.gld(junk.fit1,data=junk,param="fmkl")
# qqplot.gld(junk.fit2,data=junk,param="rs")

### Using discretised approach, with 50 classes

## Using discretised method with weights
# obj.fit1.hs<-fun.data.fit.hs(junk)

## Plot the resulting fit. The fun.plot.fit function also works for singular fits 
## such as those by fun.plot.fit(obj.fit1.ml,junk,nclass=50,
## param=c("rs","fmkl","fmkl"),xlab="x")

# fun.plot.fit(obj.fit1.hs,junk,nclass=50,param=c("rs","fmkl"),xlab="x")

## Compare the mean, variance, skewness and kurtosis of the fitted distribution 
## with actual data

# fun.theo.mv.gld(obj.fit1.hs[1,1],obj.fit1.hs[2,1],obj.fit1.hs[3,1],
# obj.fit1.hs[4,1],param="rs")
# fun.theo.mv.gld(obj.fit1.hs[1,2],obj.fit1.hs[2,2],obj.fit1.hs[3,2],
# obj.fit1.hs[4,2],param="fmkl")
# fun.moments.r(junk)

## Conduct resample KS tests
# fun.diag.ks.g(obj.fit1.hs[,1],junk,param="rs")
# fun.diag.ks.g(obj.fit1.hs[,2],junk,param="fmkl")

### Try another fit, say 15 classes

# obj.fit2.hs<-fun.data.fit.hs(junk,rs.default="N",fmkl.default="N",no.c.rs = 15, 
# no.c.fmkl = 15)

# fun.plot.fit(obj.fit2.hs,junk,nclass=50,param=c("rs","fmkl"),xlab="x")

# fun.theo.mv.gld(obj.fit2.hs[1,1],obj.fit2.hs[2,1],obj.fit2.hs[3,1],
# obj.fit2.hs[4,1],param="rs")
# fun.theo.mv.gld(obj.fit2.hs[1,2],obj.fit2.hs[2,2],obj.fit2.hs[3,2],
# obj.fit2.hs[4,2],param="fmkl")
# fun.moments.r(junk)

# fun.diag.ks.g(obj.fit2.hs[,1],junk,param="rs")
# fun.diag.ks.g(obj.fit2.hs[,2],junk,param="fmkl")

### Uses the maximum likelihood estimation method

## Fit the function using fun.data.fit.ml
# obj.fit1.ml<-fun.data.fit.ml(junk)

## Plot the resulting fit
# fun.plot.fit(obj.fit1.ml,junk,nclass=50,param=c("rs","fmkl","fmkl"),xlab="x",
# name=".ML")

## Compare the mean, variance, skewness and kurtosis of the fitted distribution 
## with actual data
# fun.comp.moments.ml(obj.fit1.ml,junk)

## Do a quantile plot

# qqplot.gld(junk,obj.fit1.ml[,1],param="rs",name="RS ML fit")

## Run a KS resample test on the resulting fit

# fun.diag2(obj.fit1.ml,junk,1000)

## It is possible to use say fun.data.fit.ml(junk,rs.leap=409,fmkl.leap=409,
## FUN="QUnif") to find solution under a different set of low discrepancy number 
## generators.

#### Bimodal distributions example:

## Fitting mixture of generalised lambda distributions on the data set using both 
## the maximum likelihood and partition maximum likelihood and plot the resulting 
## fits

# par(mfrow=c(2,1))

# junk<-fun.auto.bimodal.ml(faithful[,1],per.of.mix=0.01,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1.5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# name="Maximum likelihood using",xlab="faithful1",param.vec=c("rs","fmkl"))

## Do a quantile plot

# qqplot.gld.bi(faithful[,1],junk$par,param1="rs",param2="fmkl",
# name="RS FMKL ML fit",range=c(0.001,0.999))

# junk<-fun.auto.bimodal.pml(faithful[,1],clustering.m=clara,init1.sel="rprs",
# init2.sel="rmfmkl",init1=c(-1.5,1.5),init2=c(-0.25,1.5),leap1=3,leap2=3)
# fun.plot.fit.bm(nclass=50,fit.obj=junk,data=faithful[,1],
# name="Partition maximum likelihood using",xlab="faithful1",
# param.vec=c("rs","fmkl"))

## Fit the faithful[,1] data from the dataset library using sobol sequence 
## generator for the first distribution fit and halton sequence for the second 
## distribution fit.

# fit1<-fun.auto.bimodal.ml(faithful[,1],init1.sel="rmfmkl",init2.sel="rmfmkl",
# init1=c(-0.25,1.5),init2=c(-0.25,1.5),leap1=3,leap2=3,fun1="runif.sobol",
# fun2="runif.halton")

## Run diagnostic KS tests

# fun.diag.ks.g.bimodal(fit1$par[1:4],fit1$par[5:8],prop1=fit1$par[9],
# data=faithful[,1],param1="fmkl",param2="fmkl")

## Find the theoretical moments of the fit

# fun.theo.bi.mv.gld(fit1$par[1],fit1$par[2],fit1$par[3],fit1$par[4],"fmkl",
# fit1$par[5],fit1$par[6],fit1$par[7],fit1$par[8],"fmkl",fit1$par[9])

## Compare this with the empirical moments from the data set.

# fun.moments.r(faithful[,1])

## Do a quantile plot

# qqplot.gld.bi(faithful[,1],fit1$par,param1="fmkl",param2="fmkl",
# name="FMKL FMKL ML fit")

## Quantile matching method

## Fitting faithful data from the dataset library, with the clara clustering 
## regime. The first distribution is RS and the second distribution is fmkl. 
## The percentage of data mix is 1%.

## Fitting normal(3,2) distriution using the default setting
# junk<-rnorm(50,3,2)
# fun.data.fit.qs(junk)

# fun.auto.bimodal.qs(faithful[,1],per.of.mix=0.01,clustering.m=clara,
# init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1,5),init2=c(-0.25,1.5),
# leap1=3,leap2=3)

# L Moment matching

## Fitting normal(3,2) distriution using the default setting
# junk<-rnorm(50,3,2)
# fun.data.fit.lm(junk)

# Moment matching method

## Fitting normal(3,2) distriution using the default setting
# junk<-rnorm(50,3,2)
# fun.data.fit.mm(junk)

# Example on fitting mixture of normal distributions

#data1<-c(rnorm(1500,-1,2/3),rnorm(1500,1,2/3))

#junk<-fun.auto.bimodal.ml(data1,per.of.mix=0.01,clustering.m=data1>0,
#init1.sel="rprs",init2.sel="rmfmkl",init1=c(-1.5,1.5),init2=c(-0.25,1.5),
#leap1=3,leap2=3)

#fun.plot.fit.bm(nclass=50,fit.obj=junk,data=data1,
#name="Maximum likelihood using",xlab="faithful1",param.vec=c("rs","fmkl"))

#qqplot.gld.bi(data1,junk$par,param1="rs",param2="fmkl",
#name="RS FMKL ML fit",range=c(0.001,0.999))

# Generate random observations from FMKL generalised lambda distributions with 
# parameters (1,2,3,4) and (4,3,2,1) with 50% of data from each distribution.
fun.simu.bimodal(c(1,2,3,4),c(4,3,2,1),prop1=0.5,param1="fmkl",param2="fmkl")



