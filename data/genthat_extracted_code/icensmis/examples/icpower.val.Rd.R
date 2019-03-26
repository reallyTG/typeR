library(icensmis)


### Name: icpower.val
### Title: Study design in the presence of error-prone diagnostic tests and
###   self-reported outcomes when sensitivity and specificity are unkonwn
###   and a validation set is used
### Aliases: icpower.val

### ** Examples

surv <- exp(log(0.9)*(1:8)/8)
pow <- icpower.val(HR = 2, sensitivity = 0.55, specificity = 0.99,
   survivals = surv, power = 0.9, rhoval=0.05, design= "NTFP", designval = "NTFP")
pow$result



