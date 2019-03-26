library(spaMM)


### Name: simulate.HLfit
### Title: Simulate realizations of a fitted model.
### Aliases: simulate.HLfit simulate.HLfitlist simulate
### Keywords: datagen

### ** Examples

data("Loaloa")
HLC <- HLCor(cbind(npos,ntot-npos)~Matern(1|longitude+latitude),
           data=Loaloa,family=binomial(),
           ranPars=list(lambda=1,nu=0.5,rho=1/0.7)) 
simulate(HLC,nsim=2)

## Structured dispersion model 
data("wafers")
hl <- HLfit(y ~X1+X2+X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
            resid.model = ~ X3+I(X3^2) ,data=wafers)
simulate(hl,type="marginal",phi_type="simulate",nsim=2)



