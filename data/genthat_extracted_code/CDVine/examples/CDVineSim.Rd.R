library(CDVine)


### Name: CDVineSim
### Title: Simulation from C- and D-vine copula models
### Aliases: CDVineSim

### ** Examples

## Example 1: simulate from a 6-dimensional C-vine model 
## with Gaussian pair-copulas
d = 6
dd = d*(d-1)/2
fam1 = rep(1,dd)
par1 = c(0.2,0.69,0.73,0.22,-0.09,0.51,0.32,0.01,0.82,0.01,
         -0.2,-0.32,-0.19,-0.17,-0.06)
N = 100
U1 = CDVineSim(N,fam1,par1,type=1)
head(U1)

# calculate the log-likelihood
logLik = CDVineLogLik(U1,fam1,par1,type=1)
logLik$loglik


## Example 2: simulate from a 6-dimensional C-vine model 
## with Student t pair-copulas each with three degrees of freedom
fam2 = rep(2,dd)
par2 = rep(0.5,dd)
nu2 = rep(3,dd)
U2 = CDVineSim(N,fam2,par2,nu2,type=1)

# calculate the log-likelihood
logLik2 = CDVineLogLik(U2,fam2,par2,nu2,type=1)
logLik2$loglik


## Example 3: simulate from a 6-dimensional D-vine model
## with Student t pair-copulas each with five degrees of freedom
fam3 = rep(2,dd)
par3 = rep(0.4,dd)
nu3 = rep(5,dd)
U3 = CDVineSim(N,fam3,par3,nu3,type=2)

# calculate the log-likelihood
logLik3 = CDVineLogLik(U3,fam3,par3,nu3,type=2)
logLik3$loglik



