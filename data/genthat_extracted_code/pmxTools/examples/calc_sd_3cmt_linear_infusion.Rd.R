library(pmxTools)


### Name: calc_sd_3cmt_linear_infusion
### Title: Calculate C(t) for a 3-compartment linear model after a single
###   IV infusion
### Aliases: calc_sd_3cmt_linear_infusion

### ** Examples

Ctrough <- calc_sd_3cmt_linear_infusion(t = 11.75, CL = 3.5, V1 = 20, V2 = 500,
    V3 = 200, Q2 = 0.5, Q3 = 0.05, dose = 100, tinf=1)




