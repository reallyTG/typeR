library(spaMM)


### Name: update.HLfit
### Title: Updates a fit
### Aliases: update.HLfit update update_resp refit

### ** Examples

data("wafers")
## First the fit to be updated:
wFit <- HLfit(y ~X1*X3+X2*X3+I(X2^2)+(1|batch),family=Gamma(log),
          resid.model = ~ X3+I(X3^2) ,data=wafers)

newresp <- simulate(wFit)
update_resp(wFit,newresp=newresp)

# For estimates given by Lee et al., Appl. Stochastic Models Bus. Ind. (2011) 27:  315-328:
# Refit with given beta or/and phi values:
 
betavals <- c(5.55,0.08,-0.14,-0.21,-0.08,-0.09,-0.09)
# reconstruct fitted phi value from predictor for log(phi)
Xphi <- with(wafers,cbind(1,X3,X3^2)) ## design matrix
phifit <- exp(Xphi %*% c(-2.90,0.1,0.95))
update(wFit,formula.= . ~ offset(wFit$`X.pv` %*% betavals)+(1|batch),
       ranFix=list(lambda=exp(-3.67),phi=phifit))

## There are subtlety in performing REML fits of constrained models,
##   illustrated by thefact thatthe following fir does not recover 
##   the original likelihood values, because dispersion parameters are
##   estimated but the REML correction changes with the formula:
update(wFit,formula.= . ~ offset(wFit$`X.pv` %*% fixef(wFit))+(1|batch))
## To maintain the original REML correction, Consider instead
update(wFit,formula.= . ~ offset(wFit$`X.pv` %*% fixef(wFit))+(1|batch),
       REMLformula=wFit$predictor)  ## recover original p_v and p_bv 
## Alternatively, show original wFit as differences from betavals:  
update(wFit,formula.= . ~ . +offset(wFit$`X.pv` %*% betavals))




