library(pipe.design)


### Name: pipe.design
### Title: Dual-Agent Dose Escalation for Phase I Trials using the PIPE
###   Design
### Aliases: pipe.design

### ** Examples



## Reproducing Figure 5 from Mander and Sweeting, Statistics in Medicine 2015.
## The true probability of DLT for a 6x6 grid of dose combinations 
## (Scenario 3 from Mander and Sweeting, Statistics in Medicine 2015)
pi <-matrix(c(0.02,0.10,0.20,0.30,0.35,0.45,0.06,0.14,0.24,0.34,0.39,0.49,0.12,0.20,
0.30,0.40,0.45,0.55,0.17,0.25,0.35,0.45,0.50,0.60,0.22,0.30,0.40,0.50,0.60,0.70,0.30,
0.38,0.48,0.58,0.68,0.78),nrow=6,ncol=6)
## Using a weak prior with prior sample size 1/36 for each dose combination and prior
## median of Scenario 1
prior.med<-matrix(c(0.02,0.03,0.06,0.10,0.18,0.23,0.03,0.05,0.09,0.13,0.21,0.27,0.06,
0.09,0.14,0.18,0.26,0.30,0.11,0.14,0.18,0.23,0.30,0.36,0.18,0.21,0.26,0.30,0.39,0.44,
0.23,0.27,0.3,0.36,0.44,0.49),nrow=6,ncol=6)
## Using a neighbouring escalation constraint
## Selecting the closest admissible doses
## Using a safety constraint with epsilon = 0.8

## Obtain dose recommendations for first cohort
cohort1<-pipe.design(N=2,S=1,c=2,theta=0.3,prior.med=prior.med,
prior.ss=matrix(1/36,ncol=6,nrow=6),strategy="ss",constraint="neighbouring",
epsilon=0.8,admis="closest",alternate=FALSE)
cohort1 ## Recommends starting at (1,1)
## Second cohort
## Assume no toxicities are seen in first cohort
data1<-data.frame(patient=1:2,doseA=rep(1,2),doseB=rep(1,2),tox=rep(0,2))
cohort2<-pipe.design(data=data1,S=1,c=2,theta=0.3,prior.med=prior.med,
prior.ss=matrix(1/36,ncol=6,nrow=6),strategy="ss",constraint="neighbouring",
epsilon=0.8,admis="closest",alternate=FALSE)
cohort2 ## Recommends dosing at (2,2)
## Third cohort
## Assume one toxicity is seen in second cohort
data2<-rbind(data1,data.frame(patient=3:4,doseA=rep(2,2),doseB=rep(2,2),tox=c(1,0)))
cohort3<-pipe.design(data=data2,S=1,c=2,theta=0.3,prior.med=prior.med,
   prior.ss=matrix(1/36,ncol=6,nrow=6),strategy="ss",constraint="neighbouring",
   epsilon=0.8,admis="closest",alternate=FALSE)
cohort3 ## Recommends dosing at (1,3)


## Simulating a single trial with sample size of 40, cohort size 2 
## and target toxicity of 0.3, using true probabilities of toxicity pi
## Not run: 
##D set.seed(700)
##D example<-pipe.design(N=40,S=1,c=2,theta=0.3,pi=pi,prior.med=prior.med,
##D prior.ss=matrix(1/36,ncol=6,nrow=6),strategy="ss",constraint="neighbouring",
##D epsilon=0.8,admis="closest",alternate=FALSE)
##D example
##D plot(example)
## End(Not run)



## Not run: 
##D ## Run a Shiny GUI version of pipe.design
##D runShinyPIPE()
## End(Not run)


## Not run: 
##D ## Conducting a simulation study (1000 trials) to investigate 
##D ## operating characteristics for Scenario 3 
##D ## (as reported in Table III in Mander and Sweeting, Statistics in Medicine 2015)
##D set.seed(262)
##D scen3<-pipe.design(N=40,S=1000,c=2,theta=0.3,pi=pi,prior.med=prior.med,
##D prior.ss=matrix(1/36,ncol=6,nrow=6),strategy="ss",constraint="neighbouring",
##D epsilon=0.8,admis="closest",alternate=FALSE)
##D scen3
## End(Not run)





