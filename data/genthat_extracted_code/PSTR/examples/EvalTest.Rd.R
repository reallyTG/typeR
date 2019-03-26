library(PSTR)


### Name: EvalTest
### Title: Conduct the evaluation tests.
### Aliases: EvalTest WCB_TVTest WCB_HETest
### Keywords: evaluation

### ** Examples

## No test: 
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
    tvars=c('vala'), iT=14) # create a new PSTR object

# Estimate the model first
pstr = EstPSTR(use=pstr, im=1, iq=1, useDelta=TRUE, par=c(1.6,.5), method='CG')

# Then you can evaluate the model
pstr = EvalTest(use=pstr, vq=pstr$mQ[,1])

print(pstr, "eval")

# You can do the wild bootstrap and wild cluster bootstrap

library(snowfall)

pstr = WCB_TVTest(use=pstr, iB=4, parallel=TRUE, cpus=2)

# pstr$mQ[,1] is the transition variable stored in the object
# You can also try other transition variables.
pstr = WCB_HETest(use=pstr, vq=pstr$mQ[,1], iB=4, parallel=TRUE, cpus=2)

print(pstr, "eval")

# Don't forget to change the values of iB and cpus during experiments.
## End(No test)




