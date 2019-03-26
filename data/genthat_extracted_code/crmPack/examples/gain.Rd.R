library(crmPack)


### Name: gain
### Title: Compute the gain value with a given dose level, given a pseudo
###   DLE model, a DLE sample, a pseudo Efficacy log-log model and a
###   Efficacy sample
### Aliases: gain gain,numeric,ModelTox,Samples,Effloglog,Samples-method
###   gain,numeric,ModelTox,Samples,EffFlexi,Samples-method
###   gain,numeric,ModelTox,missing,Effloglog,missing-method
### Keywords: methods

### ** Examples

##Obtain the gain value for a given dose, a pseudo DLE model, a DLE sample, 
## a pseudo efficacy model and an efficacy sample
##The DLE model must be from 'ModelTox' class (DLEmodel slot)
emptydata<- DataDual(doseGrid=seq(25,300,25),placebo=FALSE)
data<-emptydata
DLEmodel<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
DLEsamples <- mcmc(data, DLEmodel, McmcOptions(burnin=100,step=2,samples=200))

##The efficacy model must be from 'ModelEff' class (Effmodel slot)
## The DLE and efficayc samples must be from 'Samples' class (DLEsamples and Effsamples slot)
Effmodel<-Effloglog(Eff=c(1.223,2.513),Effdose=c(25,300),nu=c(a=1,b=0.025),data=data,c=0)
Effsamples <- mcmc(data, Effmodel, McmcOptions(burnin=100,step=2,samples=200))

## Given a dose level 75,
gain(dose=75,DLEmodel=DLEmodel,DLEsamples=DLEsamples,Effmodel=Effmodel,Effsamples=Effsamples)
##Obtain the gain value for a given dose, a pseudo DLE model, a DLE sample, 
## the 'EffFlexi' efficacy model and an efficacy sample
##The DLE model must be from 'ModelTox' class (DLEmodel slot)
emptydata<- DataDual(doseGrid=seq(25,300,25))
data<-emptydata
DLEmodel<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
DLEsamples <- mcmc(data, DLEmodel, McmcOptions(burnin=100,step=2,samples=200))

##The efficacy model must be from 'EffFlexi' class (Effmodel slot)
## The DLE and efficayc samples must be from 'Samples' class (DLEsamples and Effsamples slot)
EffFleximodel <- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                     sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)
Effsamples <- mcmc(data, EffFleximodel, McmcOptions(burnin=100,step=2,samples=200))

## Given a dose level 75,
gain(dose=75,DLEmodel=DLEmodel,DLEsamples=DLEsamples,Effmodel=EffFleximodel,Effsamples=Effsamples)
##Obtain the gain value for a given dose, a pseudo DLE model and  a pseudo efficacy model
## without samples
##The DLE model must be from 'ModelTox' class (DLEmodel slot)
emptydata<- DataDual(doseGrid=seq(25,300,25),placebo=FALSE)
data<-Data(doseGrid=seq(25,300,25),placebo=FALSE)

DLEmodel<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
##The efficacy model must be from 'Effloglog' class  (Effmodel slot)
Effmodel<-Effloglog(Eff=c(1.223,2.513),Effdose=c(25,300),nu=c(a=1,b=0.025),data=emptydata,c=0)
## Given a dose level 75,
gain(dose=75,DLEmodel=DLEmodel,Effmodel=Effmodel)



