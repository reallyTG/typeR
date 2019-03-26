library(UtilityFrailtyPH12)


### Name: RunAdaptiveEFFTOX
### Title: Simulates replications from EFF-TOX phase 12 trial.
### Aliases: RunAdaptiveEFFTOX

### ** Examples

##Trial PArameters here
Nmax=30 ##Number of patients to enroll
NF=30 ##Number until AR if NF=Nmax, there's no AR.
cohort=3
#' Raw Dose Values
Dose = c(1,2,3,3.5,5)
Dose=log(Dose)-mean(log(Dose))
## Contour Vector
Contour = c(.35, .75,.7,.4)
#Starting Dose
DoseStart=1
##Safety Parameters
CutE=.3
CutT=.4
AcceptE=.1
AcceptT=.1
##Hypermeans
HypermeansEFF = c(.022,3.45,0,-4.23,3.1,0)
##Hypervariances 
HypervarsEFF = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
HypervarsEFF=HypervarsEFF^2 
#True Efficacy and Toxicity probabilities
PE=c(.2,.4,.6,.7,.7)
PT=c(.2,.2,.2,.3,.5)
corET=0
##Number of simulations
NSims=2
RESULTS=RunAdaptiveEFFTOX(NSims,Dose,PE, PT, corET, Nmax, cohort, 
NF, Contour, CutE, CutT, AcceptE, AcceptT, HypermeansEFF, HypervarsEFF )



