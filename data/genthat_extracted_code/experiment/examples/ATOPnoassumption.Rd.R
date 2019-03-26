library(experiment)


### Name: ATOPnoassumption
### Title: Bounding the ATOP when some of the Outcome Data are Missing
###   Under the Matched-Pairs Design
### Aliases: ATOPnoassumption
### Keywords: design matched-pairs

### ** Examples

data(seguro)
attach(seguro)
ATOPnoassumption(Ya,Yb,Ra,Rb,Ta,Tb,l=0,u=1,alpha=0.05,rep=100)



