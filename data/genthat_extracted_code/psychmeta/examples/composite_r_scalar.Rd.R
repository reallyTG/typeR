library(psychmeta)


### Name: composite_r_scalar
### Title: Scalar formula to estimate the correlation between a composite
###   and another variable or between two composite variables
### Aliases: composite_r_scalar

### ** Examples

## Composite correlation between 4 variables and an outside variable with which
## the four variables correlate .3 on average:
composite_r_scalar(mean_rxy = .3, k_vars_x = 4, mean_intercor_x = .4)

## Correlation between two composites:
composite_r_scalar(mean_rxy = .3, k_vars_x = 2, mean_intercor_x = .5,
                   k_vars_y = 2, mean_intercor_y = .2)



