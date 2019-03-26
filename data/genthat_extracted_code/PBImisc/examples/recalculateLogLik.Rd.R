library(PBImisc)


### Name: Likelihood displacements
### Title: Log-likelihood displacements for single observation and single
###   grouping variable
### Aliases: recalculateLogLik obsDisp groupDisp

### ** Examples

data(eunomia)
require(lme4)
set.seed(1313)
eunomias <- eunomia[sample(1:2000,100),]
groupDisp(formula = BPRS.T2~ (1|CENTRE13), data=eunomias, var="CENTRE13")
 
obsDisp(formula = BPRS.T2~ (1|CENTRE13), data=eunomias, inds = 1:10)
 
obsDisp(formula = BPRS.T2~ (1|CENTRE13), data=eunomias)
 



