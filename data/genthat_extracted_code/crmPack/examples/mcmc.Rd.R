library(crmPack)


### Name: mcmc
### Title: Obtain posterior samples for all model parameters
### Aliases: mcmc mcmc,GeneralData,GeneralModel,McmcOptions-method
###   mcmc,DataMixture,GeneralModel,McmcOptions-method
###   mcmc,Data,LogisticIndepBeta,McmcOptions-method
###   mcmc,DataDual,Effloglog,McmcOptions-method
###   mcmc,DataDual,EffFlexi,McmcOptions-method
### Keywords: methods regression

### ** Examples


# create some data from the class 'Data'
myData <- Data(x=c(0.1,0.5,1.5,3,6,10,10,10),
               y=c(0,0,0,0,0,0,1,0),
               doseGrid=c(0.1,0.5,1.5,3,6,
                          seq(from=10,to=80,by=2)))

# Initialize the CRM model 
model <- LogisticLogNormal(mean=c(-0.85, 1),
                           cov=
                             matrix(c(1, -0.5, -0.5, 1),
                                    nrow=2),
                           refDose=56)


# Sample from the posterior distribution
options <- McmcOptions(burnin=100,
                       step=2,
                       samples=1000)

samples <- mcmc(data = myData, model = model, options=options)


##obtain mcmc DLE samples given the data, LogisticIndepBeta (DLE model) and mcmc simulations options
## data must be of 'Data' class
data<-Data(x=c(25,50,50,75,100,100,225,300),y=c(0,0,0,0,1,1,1,1),
           doseGrid=seq(25,300,25))
## model must be of 'LogisticIndepBeta' class
model<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
## options must be ''McmcOptions' class
options<-McmcOptions(burnin=100,step=2,samples=200)
set.seed(94)
samples<-mcmc(data=data,model=model,options=options)
##obtain mcmc efficacy samples given the data, 'Effloglog' model (efficacy model) and
## mcmc simulations options data must be of 'DataDual' class
data<-DataDual(x=c(25,50,25,50,75,300,250,150),
              y=c(0,0,0,0,0,1,1,0),
              w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
              doseGrid=seq(25,300,25),placebo=FALSE)
## model must be of 'Effloglog' class
Effmodel<-Effloglog(Eff=c(1.223,2.513),Effdose=c(25,300),nu=c(a=1,b=0.025),data=data,c=0)

## options must be ''McmcOptions' class
options<-McmcOptions(burnin=100,step=2,samples=200)
set.seed(94)
samples<-mcmc(data=data,model=Effmodel,options=options)
##obtain mcmc efficacy samples given the data, 'EffFlexi' model (efficacy model) and 
## mcmc simulations options
## data must be of 'DataDual' class
data<-DataDual(x=c(25,50,25,50,75,300,250,150),
               y=c(0,0,0,0,0,1,1,0),
               w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
               doseGrid=seq(25,300,25))
## model must be of 'EffFlexi' class

Effmodel<- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                    sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)

## options must be ''McmcOptions' class
options<-McmcOptions(burnin=100,step=2,samples=200)
set.seed(94)
samples<-mcmc(data=data,model=Effmodel,options=options)



