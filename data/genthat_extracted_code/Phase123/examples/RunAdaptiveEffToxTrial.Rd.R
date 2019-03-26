library(Phase123)


### Name: RunAdaptiveEffToxTrial
### Title: Simulates repitions of an Adaptive Eff-Tox Trial.
### Aliases: RunAdaptiveEffToxTrial

### ** Examples

##Doses, YE,YT
##Starting Dose
DoseStart=1
##Vector of Numerical Doses
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
## Contour Vector
Contour = c(.35, .75,.7,.4)
##Hypermeans
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
##Acceptability Criteria
PiLim = c(.3,.4)
ProbLim=c(.1,.1)
##Cohort Size, N^F and N_ET
cohort=3
NF=15
NET=30
PTTrue = c(.1,.15,.25,.35,.5)
PETrue=c(.2,.4,.6,.65,.7)
##Number of iterations for MCMC
B=2000
### Number of Simulations
nSims=1
RunAdaptiveEffToxTrial(DoseStart,Dose, Hypermeans,  Hypervars,
Contour, PiLim, ProbLim,  cohort, NET,  NF, B, nSims, PETrue, PTTrue )



