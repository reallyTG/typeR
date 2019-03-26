library(pmxTools)


### Name: calc_ss_1cmt_linear_oral_1_lag
### Title: Calculate C(t) for a 1-compartment linear model with first-order
###   oral absorption at steady state, with lag time
### Aliases: calc_ss_1cmt_linear_oral_1_lag

### ** Examples

Ctrough <- calc_ss_1cmt_linear_oral_1_lag(tad=0:36, CL=2, V=25, dose=600,
    ka=0.25, tlag=0.75, tau=24)




