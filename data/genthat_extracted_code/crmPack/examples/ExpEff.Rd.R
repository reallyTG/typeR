library(crmPack)


### Name: ExpEff
### Title: Compute the expected efficacy based on a given dose, a given
###   pseudo Efficacy log-log model and a given efficacy sample
### Aliases: ExpEff ExpEff,numeric,Effloglog,Samples-method
###   ExpEff,numeric,Effloglog,missing-method
###   ExpEff,numeric,EffFlexi,Samples-method
### Keywords: methods

### ** Examples

##Obtain the expected efficacy value for a given dose, a given pseudo 
## efficacy model and a given efficacy sample
##The efficacy model must be from 'ModelEff' class (model slot)
##The efficacy sample must be from 'Samples' class (sample slot)
emptydata<-DataDual(doseGrid=seq(25,300,25))
data<-emptydata
model<- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                 sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)
options<-McmcOptions(burnin=100,step=2,samples=200)
set.seed(94)
samples<-mcmc(data=data,model=model,options=options)
## Given the dose 75 (dose slot)
ExpEff(dose=75,model=model,samples=samples)
##Obtain the expected efficacy value for a given dose and a given pseudo efficacy model 

##The efficacy model must be from 'ModelEff' class (model slot)
emptydata<-DataDual(doseGrid=seq(25,300,25),placebo=FALSE)
data<-emptydata

model<-Effloglog(Eff=c(1.223,2.513),Effdose=c(25,300),nu=c(a=1,b=0.025),data=data,c=0)


## Given the dose 75 (dose slot)
ExpEff(dose=75,model=model)
##Obtain the expected efficacy value for a given dose, the 'EffFlexi' efficacy model and 
##samples generated from this efficacy model
##The efficacy model must be from 'EffFlexi' class (model slot)
##The efficacy samples must be from 'Samples' class (samples slot)
model<- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                 sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)
set.seed(94)
samples<-mcmc(data=data,model=model,options=options)
## Given the dose 75 (dose slot)
ExpEff(dose=75,model=model,samples=samples)



