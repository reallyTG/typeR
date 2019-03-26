library(bcrm)


### Name: Posterior
### Title: Calculate posterior distribution of CRM model parameter(s)
### Aliases: Posterior.exact Posterior.rjags Posterior.BRugs
###   Posterior.R2WinBUGS

### ** Examples

## Dose-escalation cancer trial example as described in Neuenschwander et al 2008.
## Pre-defined doses
dose<-c(1,2.5,5,10,15,20,25,30,40,50,75,100,150,200,250)
## Pre-specified probabilities of toxicity
## [dose levels 11-15 not specified in the paper, and are for illustration only]
p.tox0<-c(0.010,0.015,0.020,0.025,0.030,0.040,0.050,0.100,0.170,0.300,0.400,0.500,0.650
  ,0.800,0.900)
## Data from the first 5 cohorts of 18 patients
tox<-c(0,0,0,0,0,0,2,0,0,0,0,0,0,0,0)
notox<-c(3,4,5,4,0,0,0,0,0,0,0,0,0,0,0)
## Target toxicity level
target.tox<-0.30
## Lognormal prior
prior.alpha<-list(3,0,1.34^2)
## Power functional form
ff<-"power"
## Standardised doses
sdose<-find.x(ff,p.tox0,alpha=1)

## Posterior distribution of the model parameter using exact computation
post.exact<-Posterior.exact(tox,notox,sdose,ff,prior.alpha)
print(post.exact)

## Posterior distribution of the model parameter using rjags
post.rjags<-Posterior.rjags(tox,notox,sdose,ff,prior.alpha
  ,burnin.itr=2000,production.itr=2000)
print(mean(post.rjags))
hist(post.rjags)

## Posterior distribution of the model parameter using BRugs (Windows and i386 Linux only)
if(Sys.info()["sysname"] %in% c("Windows","Linux")){
	post.BRugs<-Posterior.BRugs(tox,notox,sdose,ff,prior.alpha
	  ,burnin.itr=2000,production.itr=2000)
	print(mean(post.BRugs))
	hist(post.BRugs)
	}



