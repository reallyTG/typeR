library(robumeta)


### Name: print.robu
### Title: Outputs Model Information
### Aliases: print.robu
### Keywords: robu

### ** Examples



# Load data
data(hierdat)

### Small-Sample Corrections - Hierarchical Dependence Model
HierMod  <-  robu(formula = effectsize ~ binge + followup + sreport
                   + age, data = hierdat, studynum = studyid, 
                   var.eff.size = var, modelweights = "HIER", small = FALSE)

print(HierMod) # Output results




