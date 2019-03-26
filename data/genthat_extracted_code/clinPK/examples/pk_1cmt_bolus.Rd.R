library(clinPK)


### Name: pk_1cmt_bolus
### Title: Concentration predictions for 1-compartmental PK model after
###   single or multiple bolus doses
### Aliases: pk_1cmt_bolus

### ** Examples

pk_1cmt_bolus(dose = 500, tau = 12, CL = 5, V = 50)
pk_1cmt_bolus(dose = 500, tau = 12, CL = 5, V = 50, t = 24)
pk_1cmt_bolus(
  dose = 500, tau = 12, CL = 5, V = 50,
  ruv = list(prop = 0.1, add = 0.1))



