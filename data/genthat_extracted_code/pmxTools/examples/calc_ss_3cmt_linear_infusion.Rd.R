library(pmxTools)


### Name: calc_ss_3cmt_linear_infusion
### Title: Calculate C(t) for a 3-compartment linear model at steady state
###   with IV infusions
### Aliases: calc_ss_3cmt_linear_infusion

### ** Examples

Ctrough <- calc_ss_3cmt_linear_infusion(tad = 11.75, CL = 2.5, V1 = 20, V2 = 50,
    V3 = 100, Q2 = 0.5, Q3 = 0.05, dose = 1000, tinf=1, tau=24)




