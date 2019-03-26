library(pmxTools)


### Name: calc_ss_2cmt_linear_oral_0_lag
### Title: Calculate C(t) for a 2-compartment linear model at steady-state
###   with zero-order oral dosing and a lag time
### Aliases: calc_ss_2cmt_linear_oral_0_lag

### ** Examples

Ctrough <- calc_ss_2cmt_linear_oral_0_lag(tad = 23, CL = 2.5, V1 = 20, V2 = 30, Q = 0.5,
    dose = 1000, dur = 1, tau = 24, tlag=2)




