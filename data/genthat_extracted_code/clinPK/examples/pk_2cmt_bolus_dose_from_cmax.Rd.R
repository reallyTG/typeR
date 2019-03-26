library(clinPK)


### Name: pk_2cmt_bolus_dose_from_cmax
### Title: Calculate dose to achieve steady state Cmax for 2-compartmental
###   PK model bolus dosing at steady state
### Aliases: pk_2cmt_bolus_dose_from_cmax

### ** Examples

dos <- pk_2cmt_bolus_dose_from_cmax(
  cmax = 10, tau = 12,
  CL = 5, V = 50, Q = 20, V2 = 200)
find_nearest_dose(dos, 100)



