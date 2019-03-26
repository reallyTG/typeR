library(jomo)


### Name: jomo.coxph.MCMCchain
### Title: coxph Compatible JM Imputation - A tool to check convergence of
###   the MCMC
### Aliases: jomo.coxph.MCMCchain

### ** Examples

    # define substantive model

    formula<-as.formula(Surv(time, status) ~ measure + sex + I(measure^2))
    
    #Run imputation
    
if (requireNamespace("survival", quietly = TRUE)) {
  library(survival)
  imp<-jomo.coxph.MCMCchain(formula,surdata, nburn = 100)
  }
    



