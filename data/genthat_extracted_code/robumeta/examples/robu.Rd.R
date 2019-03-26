library(robumeta)


### Name: robu
### Title: Fitting Robust Variance Meta-Regression Models
### Aliases: robu CORR HIER USER
### Keywords: robu

### ** Examples



# Load data
data(hierdat)

# Small-Sample Corrections - Hierarchical Dependence Model
HierModSm <-  robu(formula = effectsize ~ binge + followup + sreport
                   + age, data = hierdat, studynum = studyid, 
                   var.eff.size = var, modelweights = "HIER", small = TRUE)

print(HierModSm) # Output results




