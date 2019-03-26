library(bcrm)


### Name: bcrm
### Title: Bayesian Continual Reassessment Method for Phase I
###   Dose-Escalation Trials
### Aliases: bcrm

### ** Examples

## Dose-escalation cancer trial example as described in Neuenschwander et al 2008.
## Pre-defined doses
dose<-c(1,2.5,5,10,15,20,25,30,40,50,75,100,150,200,250)
## Pre-specified probabilities of toxicity
## [dose levels 11-15 not specified in the paper, and are for illustration only]
p.tox0<-c(0.010,0.015,0.020,0.025,0.030,0.040,0.050,0.100,0.170,0.300,0.400,0.500,0.650
  ,0.800,0.900)
## Data from the first 5 cohorts of 18 patients
data<-data.frame(patient=1:18,dose=rep(c(1:4,7),c(3,4,5,4,2)),tox=rep(0:1,c(16,2)))
## Target toxicity level
target.tox<-0.30

## A 1-parameter power model is used, with standardised doses calculated using 
## the plug-in prior median
## Prior for alpha is lognormal with mean 0 (on log scale) 
## and standard deviation 1.34 (on log scale)
## The recommended dose for the next cohort if posterior mean is used
Power.LN.bcrm<-bcrm(stop=list(nmax=18),data=data,p.tox0=p.tox0,dose=dose
  ,ff="power",prior.alpha=list(3,0,1.34^2),target.tox=target.tox,constrain=FALSE
  ,sdose.calculate="median",pointest="mean")
print(Power.LN.bcrm)
plot(Power.LN.bcrm)

## Simulate 10 replicate trials of size 36 (cohort size 3) using this design 
## with constraint (i.e. no dose-skipping) and starting at lowest dose
## True probabilities of toxicity are set to pre-specified probabilities (p.tox0) 
Power.LN.bcrm.sim<-bcrm(stop=list(nmax=36),p.tox0=p.tox0,dose=dose,ff="power"
  ,prior.alpha=list(3,0,1.34^2),target.tox=target.tox,constrain=TRUE
  ,sdose.calculate="median",pointest="mean",start=1,simulate=TRUE,nsims=10,truep=p.tox0)
print(Power.LN.bcrm.sim)
plot(Power.LN.bcrm.sim)

## Comparing this CRM design with the standard 3+3 design 
## (only considering the first 12 dose levels)
## Not run: 
##D Power.LN.bcrm.compare.sim<-bcrm(stop=list(nmax=36),p.tox0=p.tox0[1:12],dose=dose[1:12]
##D   ,ff="power",prior.alpha=list(3,0,1.34^2),target.tox=target.tox,constrain=TRUE
##D   ,sdose.calculate="median",pointest="mean",start=1,simulate=TRUE,nsims=50
##D   ,truep=p.tox0[1:12],threep3=TRUE)
##D print(Power.LN.bcrm.compare.sim,threep3=TRUE)
##D plot(Power.LN.bcrm.compare.sim,threep3=TRUE)
## End(Not run)

## A 2-parameter model, using priors as specified in Neuenschwander et al 2008.
## Posterior mean used to choose the next dose
## Standardised doses using reference dose, 250mg
sdose<-log(dose/250)
## Bivariate lognormal prior for two parameters
mu<-c(2.15,0.52)
Sigma<-rbind(c(0.84^2,0.134),c(0.134,0.80^2))
## Using rjags (requires JAGS to be installed)
TwoPLogistic.mean.bcrm<-bcrm(stop=list(nmax=18),data=data,sdose=sdose
  ,dose=dose,ff="logit2",prior.alpha=list(4,mu,Sigma),target.tox=target.tox
  ,constrain=FALSE,pointest="mean",method="rjags")
print(TwoPLogistic.mean.bcrm)
plot(TwoPLogistic.mean.bcrm)

## A 2-parameter model, using an EWOC design with feasibility bound (MTD quantile) 
## of 0.25 to choose the next dose
## Using rjags (requires JAGS to be installed)
## Not run: 
##D TwoPLogistic.EWOC0.25.bcrm<-bcrm(stop=list(nmax=18),data=data,sdose=sdose,dose=dose
##D 	  ,ff="logit2",prior.alpha=list(4,mu,Sigma),target.tox=target.tox,constrain=FALSE
##D 	  ,pointest=0.25,method="rjags")
##D print(TwoPLogistic.EWOC0.25.bcrm)
##D plot(TwoPLogistic.EWOC0.25.bcrm)
## End(Not run)

## A 2-parameter model, using a loss function based on intervals of toxicity to choose
## the next dose
## Using rjags (requires JAGS to be installed)
## Not run: 
##D ## Toxicity cut-points
##D tox.cutpoints<-c(0.2,0.35,0.6)
##D ## Losses associated with toxicity intervals 
##D ## [0,0.2]=1, (0.2,0.35]=0, (0.35,0.6]=1, (0.6,1]=2
##D loss<-c(1,0,1,2)
##D TwoPLogistic.tox.intervals.bcrm<-bcrm(stop=list(nmax=18),data=data,sdose=sdose
##D   ,dose=dose,ff="logit2",prior.alpha=list(4,mu,Sigma),target.tox=target.tox
##D   ,constrain=FALSE,tox.cutpoints=tox.cutpoints,loss=loss,method="rjags")
##D print(TwoPLogistic.tox.intervals.bcrm)
##D plot(TwoPLogistic.tox.intervals.bcrm)
##D ## Greater loss associated with overdosing and unacceptable toxicity
##D ## [0,0.2]=1, (0.2,0.35]=0, (0.35,0.6]=2, (0.6,1]=4
##D loss2<-c(1,0,2,4)
##D TwoPLogistic.tox.intervals.2.bcrm<-bcrm(stop=list(nmax=18),data=data,sdose=sdose
##D   ,dose=dose,ff="logit2",prior.alpha=list(4,mu,Sigma),target.tox=target.tox
##D   ,constrain=FALSE,tox.cutpoints=tox.cutpoints,loss=loss2,method="rjags")
##D print(TwoPLogistic.tox.intervals.2.bcrm)
##D plot(TwoPLogistic.tox.intervals.2.bcrm)
## End(Not run)




