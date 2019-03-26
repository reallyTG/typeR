library(pmxTools)


### Name: calc_ss_2cmt_linear_bolus
### Title: Calculate C(t) for a 2-compartment linear model with IV bolus
###   dosing at steady-state
### Aliases: calc_ss_2cmt_linear_bolus

### ** Examples

Ctrough <- calc_ss_2cmt_linear_bolus(tad = 11.75, CL = 7.5, V1 = 20, V2 = 30, Q = 0.5,
    dose = 10, tau=24)




