library(clinPK)


### Name: calc_egfr
### Title: Calculate eGFR
### Aliases: calc_egfr

### ** Examples

calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70)
calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70, unit_out = "L/hr")
calc_egfr(sex = "male", age = 50, scr = 1.1, weight = 70, bsa = 1.8, method = "ckd_epi")
calc_egfr(sex = "male", age = 50, scr = c(1.1, 0.8),
  weight = 70, height = 170, method = "jelliffe")
calc_egfr(sex = "male", age = 50, scr = c(1.1, 0.8),
  weight = 70, height = 170, method = "jelliffe_unstable")
calc_egfr(sex = "male", age = 50, scr = 1.1,
  weight = 70, bsa = 1.6, method = "malmo_lund_rev", relative = FALSE)



