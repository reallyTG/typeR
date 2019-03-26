library(pmxTools)


### Name: calc_ss_3cmt_linear_oral_0_lag
### Title: Calculate C(t) for a 3-compartment linear model at steady state,
###   with zero-order absorption and lag time
### Aliases: calc_ss_3cmt_linear_oral_0_lag

### ** Examples

Ctrough <- calc_ss_3cmt_linear_oral_0_lag(tad = 11.75, CL = 3.5, V1 = 20, V2 = 500,
    V3 = 200, Q2 = 0.5, Q3 = 0.05, dur = 1, dose = 100, tau = 24, tlag = 1.5)




