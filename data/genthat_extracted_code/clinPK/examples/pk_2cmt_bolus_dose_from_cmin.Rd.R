library(clinPK)


### Name: pk_2cmt_bolus_dose_from_cmin
### Title: Calculate dose to achieve steady state trough for
###   2-compartmental PK model bolus dosing at steady state
### Aliases: pk_2cmt_bolus_dose_from_cmin

### ** Examples

dos <- pk_2cmt_bolus_dose_from_cmin(
  cmin = 5, tau = 12,
  CL = 5, V = 50, Q = 20, V2 = 200)
find_nearest_dose(dos, 100)



