library(clinPK)


### Name: pk_1cmt_bolus_dose_from_cmax
### Title: Calculate dose to achieve steady state Cmax for 1-compartmental
###   PK model bolus dosing at steady state
### Aliases: pk_1cmt_bolus_dose_from_cmax

### ** Examples

dos <- pk_1cmt_bolus_dose_from_cmax(
  cmax = 10, tau = 12, CL = 5, V = 50)
find_nearest_dose(dos, 100)



