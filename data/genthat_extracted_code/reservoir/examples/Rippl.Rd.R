library(reservoir)


### Name: Rippl
### Title: Rippl analysis
### Aliases: Rippl

### ** Examples

# define a release vector for a constant release equal to 90 % of the mean inflow
no_fail_storage <- Rippl(resX$Q_Mm3, target = 0.9 * mean(resX$Q_Mm3))$No_fail_storage



