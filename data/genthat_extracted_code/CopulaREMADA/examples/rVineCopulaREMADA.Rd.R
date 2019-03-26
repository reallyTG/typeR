library(CopulaREMADA)


### Name: rVineCopulaREMADA
### Title: Simulation from trivariate vine copula mixed models for
###   diagnostic test accuaracy studies accounting for disease prevalence
###   and non-evaluable results
### Aliases: rVineCopulaREMADA rVineCopulaREMADA.norm
###   rVineCopulaREMADA.beta
### Keywords: simulation

### ** Examples

p=c(0.8,0.7,0.4)
g=c(0.1,0.1,0.05)
taus=c(-0.5,-0.3,-0.0001)
qcondcop12=qcondcop23=qcondcop13=qcondcln90
tau2par12=tau2par23=tau2par13=tau2par.cln90
# in the absence of non-evaluable results
omega1=0
omega0=0
rVineCopulaREMADA.beta(50,p,g,taus,omega1,omega0,
qcondcop12,qcondcop13,qcondcop23,tau2par12,
tau2par13,tau2par23)
# in the presence of non-evaluable results
omega1=0.1
omega0=0.2
rVineCopulaREMADA.beta(50,p,g,taus,omega1,omega0,
qcondcop12,qcondcop13,qcondcop23,tau2par12,
tau2par13,tau2par23)



