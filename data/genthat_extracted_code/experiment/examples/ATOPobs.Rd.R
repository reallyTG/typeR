library(experiment)


### Name: ATOPobs
### Title: Sensitivity analysis for the ATOP when some of the Outcome Data
###   are Missing Under the Matched-Pairs Design in Observational Studies
### Aliases: ATOPobs
### Keywords: design matched-pairs

### ** Examples

data(seguro)
attach(seguro)
ATOPsens(Ya,Yb,Ra,Rb,Ta,Tb,gamma=0.95,l=0,u=1,alpha=0.05,rep=100)



