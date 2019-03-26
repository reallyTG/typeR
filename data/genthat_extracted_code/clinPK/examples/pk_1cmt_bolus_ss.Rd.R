library(clinPK)


### Name: pk_1cmt_bolus_ss
### Title: Concentration predictions for 1-compartmental PK model with
###   bolus dosing at steady state
### Aliases: pk_1cmt_bolus_ss

### ** Examples

pk_1cmt_bolus_ss(dose = 500, tau = 12, CL = 5, V = 50)
pk_1cmt_bolus_ss(
  dose = 500, tau = 12, CL = 5, V = 50,
  ruv = list(prop = 0.1, add = 0.1))



