library(robumeta)


### Name: sensitivity
### Title: Sensitivity Analysis for Correlated Effects RVE
### Aliases: sensitivity
### Keywords: robu

### ** Examples



# Correlated Effects Model
CorrMod   <-  robu(formula = effectsize ~ followup + males + binge + college, 
                   data = corrdat, studynum = studyid, var.eff.size = var, 
                   rho = .8, modelweights = "CORR", small = FALSE)

sensitivity(CorrMod) # Output sensitivity




