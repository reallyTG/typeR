library(Phase123)


### Name: SimPhase3
### Title: Performs one replication of phase 3 for the phase 123 design,
###   given phase 12 data.
### Aliases: SimPhase3

### ** Examples

library(survival)
##True Efficacy and Toxicity Probabilities
PT = c(.1,.15,.25,.35,.5)
PE=c(.2,.4,.6,.65,.7)
##Dose Levels considered
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
##Average accrual rate for phase III
Accrue = 10
#'##Hypermeans for Eff-Tox
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
Contour = c(.35, .75,.7,.4)
PiLim = c(.3,.4)
ProbLim=c(.1,.1)
###Family of Distributions
Family="Exponential"
###Shape parameter ## Doesn't matter for exponential distribution
alpha=1
###True Beta vector
betaA = c(.75,-.5, .3, -.25,2.143)
##True beta vector for efficacy, toxicity and intercept of the control treatment
betaC=c(.3,-.25,2.389)
##True efficacy and toxicity probability for control group
ProbC = c(.4,.15)
##Waiting time in between
Twait=1
###How long is the time window in phase 12?
Time12=1
##Dose to start phase 3 with
Opt=3
##Make matrix with old phase 12 data
Doses= c(1,1,1,2,2,2,1,1,1,3,3,3,1,1,1,2,2,2)
YE = c(0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,1,1,0)
YT=c(0,0,0,1,1,0,1,0,0,1,1,1,0,0,0,1,0,0)
##Accrual Times for old data
Accrue12=2
##Size of phase 12 cohort
cohort=3
ACC1=cumsum(rexp(length(YT),Accrue12))
##Accrual times are the same for each cohort in phase 12
Grab = rep(NA,length(YT)/cohort)
for(m in 1:length(Grab)){Grab[m]=ACC1[m*3]}
for(m in 1:length(Grab)){ACC1[((m-1)*cohort+1):((m-1)*cohort+cohort)]=rep(Grab[m],cohort)}
Phase12 = cbind(Doses,YE,YT,ACC1)
betaC=c(.3,-.25,2.389)
##True efficacy and toxicity probability for control group
ProbC = c(.4,.15)
##Max Sample Size
Nmax=500
###Number of patient events to Re-optimize doses
NLookSwitch = 50
##Number of patient events for interim looks
NLook = c(200,300,400)
##Superiority Boundaries
Sup = c(2.96, 2.53,1.99)
##Futility Boundaries (0 means no futility decision)
Fut = c(0,1.001,0)
##Starting Dose, hat(x)_ET
Opt=3
##Number of simulations to run
nSims=10
SimPhase3(Dose,Phase12,PE,PT,Hypermeans,Hypervars,betaA,
ProbC,betaC,Family,alpha,Nmax,Opt,Accrue,
Time12,Twait,NLookSwitch,NLook,Sup,Fut)



