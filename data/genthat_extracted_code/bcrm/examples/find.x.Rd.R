library(bcrm)


### Name: find.x
### Title: Obtain samples from the maximum tolerated dose (MTD)
###   distribution.
### Aliases: find.x

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

## Prior distribution for the MTD given a lognormal(0,1.34^2) distribution for alpha
## and a power model functional form
prior.alpha<-list(3,0,1.34^2)
ff<-"power"
samples.alpha<-getprior(prior.alpha,2000)
mtd<-find.x(ff,target.tox,alpha=samples.alpha)
hist(mtd)

## Standardised doses
sdose<-find.x(ff,p.tox0,alpha=1)

## Posterior distribution of the MTD (on standardised dose scale) using data 
## from the cancer trial described in Neuenschwander et al 2008.
## Using rjags
posterior.samples<-Posterior.rjags(tox,notox,sdose,ff,prior.alpha
  ,burnin.itr=2000,production.itr=2000)
posterior.mtd<-find.x(ff,target.tox,alpha=posterior.samples)
hist(posterior.mtd)




