library(pmxTools)


### Name: calc_ss_2cmt_linear_oral_1_lag
### Title: Calculate C(t) for a 2-compartment linear model at steady-state
###   with first-order oral dosing
### Aliases: calc_ss_2cmt_linear_oral_1_lag

### ** Examples

Ctrough <- calc_ss_2cmt_linear_oral_1_lag(tad = 11.75, CL = 7.5, V1 = 20, V2 = 30, Q = 0.5,
    dose = 1000, ka = 1, tau=24, tlag=2)




