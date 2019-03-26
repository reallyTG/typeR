library(pmxTools)


### Name: calc_ss_3cmt_linear_oral_1
### Title: Calculate C(t) for a 3-compartment linear model at steady-state
###   with first-order oral dosing
### Aliases: calc_ss_3cmt_linear_oral_1

### ** Examples

Ctrough <- calc_ss_3cmt_linear_oral_1(tad = 11.75, CL = 3.5, V1 = 20,
    V2 = 500, V3 = 200, Q2 = 0.5, Q3 = 0.05, ka = 1, dose = 100, tau = 24)




