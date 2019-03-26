library(rvinecopulib)


### Name: par_to_ktau
### Title: Conversion between Kendall's tau and parameters
### Aliases: par_to_ktau ktau_to_par

### ** Examples

# the following are equivalent
par_to_ktau(bicop_dist("clayton", 0, 3))
par_to_ktau("clayton", 0, 3)

ktau_to_par("clayton", 0.5)
ktau_to_par(bicop_dist("clayton", 0, 3), 0.5)



