library(experiment)


### Name: ATOPsens
### Title: Sensitivity analysis for the ATOP when some of the Outcome Data
###   are Missing Under the Matched-Pairs Design
### Aliases: ATOPsens
### Keywords: design matched-pairs

### ** Examples

data(seguro)
attach(seguro)
ATOPobs(Ya,Yb,Ra,Rb,Ta,Tb,gamma=0.95,kappa1=1,kappa0=1,l=0,u=1,alpha=0.05,rep=100)



