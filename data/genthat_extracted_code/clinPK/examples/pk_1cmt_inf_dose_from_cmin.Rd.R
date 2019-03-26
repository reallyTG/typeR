library(clinPK)


### Name: pk_1cmt_inf_dose_from_cmin
### Title: Calculate dose to achieve steady state trough for
###   1-compartmental PK model with infusion dosing at steady state
### Aliases: pk_1cmt_inf_dose_from_cmin

### ** Examples

dos <- pk_1cmt_inf_dose_from_cmin(
  cmin = 20, tau = 12, t_inf = 2,
  CL = 5, V = 50)
find_nearest_dose(dos, 100)



