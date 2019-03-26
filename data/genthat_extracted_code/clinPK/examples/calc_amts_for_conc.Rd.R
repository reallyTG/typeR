library(clinPK)


### Name: calc_amts_for_conc
### Title: Calculate the amounts in all compartments in a compartmental PK
###   system based on a given concentration in the central compartment, and
###   assuming steady state.
### Aliases: calc_amts_for_conc

### ** Examples

calc_amts_for_conc(conc = 10, parameters = list(CL = 5, V = 50), n_cmt = 1)
calc_amts_for_conc(
  conc = 10,
  parameters = list(CL = 5, V = 50, Q = 20, V2 = 100),
  n_cmt = 2)
calc_amts_for_conc(
  conc = 10,
  parameters = list(CL = 5, V = 50, Q = 20, V2 = 100, Q2 = 30, V3 = 200),
  n_cmt = 3)



