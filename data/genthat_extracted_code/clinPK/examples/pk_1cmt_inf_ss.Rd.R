library(clinPK)


### Name: pk_1cmt_inf_ss
### Title: Concentration predictions for 2-compartmental PK model with
###   infusion dosing at steady state
### Aliases: pk_1cmt_inf_ss

### ** Examples

pk_1cmt_inf_ss(dose = 500, tau = 12, t_inf = 2, CL = 5, V = 50)
pk_1cmt_inf_ss(
  dose = 500, tau = 12, t_inf = 2, CL = 5, V = 50,
  ruv = list(prop = 0.1, add = 0.1))



