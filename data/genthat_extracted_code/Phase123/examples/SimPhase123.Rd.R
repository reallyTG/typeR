library(Phase123)


### Name: SimPhase123
### Title: Simulates replications of the phase123 and phase 12-3 trials.
### Aliases: SimPhase123

### ** Examples

 ##We need to specify Phase 12,
###Phase 3 trial paramters,
##the additional phase 123 parameters and simulation parameters
#This is scenario 3 for the exponetial case
##the additional phase 123 parameters and simulation parameters
###########PHASE12 Parameters ##################
DoseStart=1
##True Efficacy and Toxicity Probabilities
PT = c(.05,.08,.1,.15,.2)
PE=c(.2,.25,.35,.4,.55)
##Raw Dose Levels considered
Dose = c(1,2,3,3.5,5)
#Max Sample Size
NET=30
##Number of patients before randomization
NF=15
##Cohort size
cohort=3
##Hypermeans for Eff-Tox
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
##Contour Vector
Contour = c(.35, .75,.7,.4)
##Acceptability Criteria
PiLim = c(.3,.4)
ProbLim=c(.1,.1)
##Phase 12 accrual rate
Accrue12=5
###How long is the time window in phase 12?
Time12=1
##########PHASE3 Parameters####################
Nmax=500
##Number of patient events for interim looks
NLook = c(200,300,400)
##Superiority Boundaries
Sup = c(2.96, 2.53,1.99)
##Futility Boundaries (0 means no futility decision)
Fut = c(0,1.001,0)
##Average accrual rate for phase III
Accrue = 10
###########Phase123 Parameters###########
###Number of patient events to re-optimize doses
NLookSwitch=50
##Time in between phase 12 and phase 3
Twait=1
#########Simulation Parameters######
###Family of Distributions
Family="Gamma"
###Shape parameter, Not needed for Exponential
alpha=1
###True Beta vector (beta_1,exp(beta_E),-exp(beta_T),beta_2,beta_0)
betaA = c(.1, .3, -1,-1,3.6)
##True beta vector for (exp(beta_E),-exp(beta_T),beta_C)  of the control treatment
betaC=c(.3,-1,log(24/1.035111))
##True efficacy and toxicity probability for control group
ProbC = c(.3,.1)
##Number of simulations to run
nSims=1
##Run Simulations
Results=SimPhase123(DoseStart,Dose,PE,PT,Hypermeans,Hypervars,Contour,
                 PiLim,ProbLim,NET,NF,Accrue12,Time12,cohort,betaA,ProbC,betaC,
                Family,alpha,Nmax,Accrue,Twait,NLookSwitch,NLook,Sup,Fut,nSims)



