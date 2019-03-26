library(crmPack)


### Name: fit
### Title: Fit method for the Samples class
### Aliases: fit fit,Samples,Model,Data-method
###   fit,Samples,DualEndpoint,DataDual-method
###   fit,Samples,LogisticIndepBeta,Data-method
###   fit,Samples,Effloglog,DataDual-method
###   fit,Samples,EffFlexi,DataDual-method
### Keywords: methods

### ** Examples


# Create some data
data <- Data(x = c(0.1, 0.5, 1.5, 3, 6, 10, 10, 10),
             y = c(0, 0, 0, 0, 0, 0, 1, 0),
             cohort = c(0, 1, 2, 3, 4, 5, 5, 5),
             doseGrid = c(0.1, 0.5, 1.5, 3, 6,
                          seq(from = 10, to = 80, by=2)))

# Initialize a model 
model <- LogisticLogNormal(mean = c(-0.85, 1),
                           cov = matrix(c(1, -0.5, -0.5, 1), nrow = 2),
                           refDose = 56)

# Get posterior for all model parameters
options <- McmcOptions(burnin = 100,
                       step = 2,
                       samples = 2000)
set.seed(94)
samples <- mcmc(data, model, options)

# Extract the posterior mean  (and empirical 2.5 and 97.5 percentile)
# for the prob(DLT) by doses
fitted <- fit(object = samples,
              model = model,
              data = data,
              quantiles=c(0.025, 0.975),
              middle=mean)


# ----------------------------------------------
# A different example using a different model
## we need a data object with doses >= 1:
data<-Data(x=c(25,50,50,75,150,200,225,300),
           y=c(0,0,0,0,1,1,1,1),
           doseGrid=seq(from=25,to=300,by=25))


model <- LogisticIndepBeta(binDLE=c(1.05,1.8),
                           DLEweights=c(3,3),
                           DLEdose=c(25,300),
                           data=data)
options <- McmcOptions(burnin=100,
                       step=2,
                       samples=200)
## samples must be from 'Samples' class (object slot in fit)
samples <- mcmc(data,model,options)

fitted <- fit(object=samples, model=model, data=data)



# Create some data
data <- DataDual(
  x=c(0.1, 0.5, 1.5, 3, 6, 10, 10, 10,
      20, 20, 20, 40, 40, 40, 50, 50, 50),
  y=c(0, 0, 0, 0, 0, 0, 1, 0,
      0, 1, 1, 0, 0, 1, 0, 1, 1),
  w=c(0.31, 0.42, 0.59, 0.45, 0.6, 0.7, 0.55, 0.6,
      0.52, 0.54, 0.56, 0.43, 0.41, 0.39, 0.34, 0.38, 0.21),
  doseGrid=c(0.1, 0.5, 1.5, 3, 6,
             seq(from=10, to=80, by=2)))

# Initialize the Dual-Endpoint model (in this case RW1)
model <- DualEndpointRW(mu = c(0, 1),
                        Sigma = matrix(c(1, 0, 0, 1), nrow=2),
                        sigma2betaW = 0.01,
                        sigma2W = c(a=0.1, b=0.1),
                        rho = c(a=1, b=1),
                        smooth = "RW1")

# Set-up some MCMC parameters and generate samples from the posterior
options <- McmcOptions(burnin=100,
                       step=2,
                       samples=500)
set.seed(94)
samples <- mcmc(data, model, options)

# Extract the posterior mean  (and empirical 2.5 and 97.5 percentile)
# for the prob(DLT) by doses and the Biomarker by doses
fitted <- fit(object = samples,
              model = model,
              data = data,
              quantiles=c(0.025, 0.975),
              middle=mean)
##Obtain the 'fit' the middle, uppper and lower quantiles for the dose-DLE curve
## at all dose levels using a DLE sample, a DLE model and the data
## samples must be from 'Samples' class (object slot)
## we need a data object with doses >= 1:
data<-Data(x=c(25,50,50,75,150,200,225,300),
           y=c(0,0,0,0,1,1,1,1),
           doseGrid=seq(from=25,to=300,by=25))
## model must be from 'Model' or 'ModelTox' class e.g using 'LogisticIbdepBeta' model class
model<-LogisticIndepBeta(binDLE=c(1.05,1.8),DLEweights=c(3,3),DLEdose=c(25,300),data=data)
##options for MCMC
options<-McmcOptions(burnin=100,step=2,samples=200)
## samples must be from 'Samples' class (object slot in fit)
samples<-mcmc(data,model,options)

fit(object=samples, model=model,data=data)
##Obtain the 'fit' the middle, uppper and lower quantiles for the dose-efficacy curve
## at all dose levels using an efficacy sample, a pseudo efficacy model and the data
## data must be from 'DataDual' class
data<-DataDual(x=c(25,50,25,50,75,300,250,150),
               y=c(0,0,0,0,0,1,1,0),
               w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
               doseGrid=seq(25,300,25),
               placebo=FALSE)
## model must be from 'ModelEff' e.g using 'Effloglog' class
Effmodel<-Effloglog(c(1.223,2.513),c(25,300),nu=c(a=1,b=0.025),data=data,c=0)
## samples must be from 'Samples' class (object slot in fit)
options<-McmcOptions(burnin=100,step=2,samples=200)
Effsamples <- mcmc(data=data,model=Effmodel,options=options)
fit(object=Effsamples, model=Effmodel,data=data)
##Obtain the 'fit' the middle, uppper and lower quantiles for the dose-efficacy curve
## at all dose levels using an efficacy sample, the 'EffFlexi' efficacy model and the data
## data must be from 'DataDual' class
data<-DataDual(x=c(25,50,25,50,75,300,250,150),
               y=c(0,0,0,0,0,1,1,0),
               w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
               doseGrid=seq(25,300,25),
               placebo=FALSE)
## model must be from 'ModelEff' e.g using 'Effloglog' class
Effmodel<- EffFlexi(Eff=c(1.223, 2.513),Effdose=c(25,300),
                    sigma2=c(a=0.1,b=0.1),sigma2betaW=c(a=20,b=50),smooth="RW2",data=data)

## samples must be from 'Samples' class (object slot in fit)
options<-McmcOptions(burnin=100,step=2,samples=200)
Effsamples <- mcmc(data=data,model=Effmodel,options=options)
fit(object=Effsamples, model=Effmodel,data=data)



