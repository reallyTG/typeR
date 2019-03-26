library(ThreeGroups)


### Name: ThreeG
### Title: ML Estimator for Baseline-Placebo-Treatment (Three-Group)
###   Experiments
### Aliases: ThreeG

### ** Examples

#
# This example replicates the empirical analysis presented in
# Gerber, Green, Kaplan, and Kern (2010), Table 5, first column.
#
# input data
sstat <- list(
s_b = 51766,
f_b = 253182,

s_t_c = 858,
f_t_c = 3128,

s_t_nc = 650,
f_t_nc = 3812,

s_p_c = 752,
f_p_c = 3154,

s_p_nc = 672,
f_p_nc = 3779)

#
# let's estimate the complier average treatment effect
#
out <- ThreeG(sstat)



