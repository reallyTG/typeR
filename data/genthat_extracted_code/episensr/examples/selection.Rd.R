library(episensr)


### Name: selection
### Title: Sensitivity analysis to correct for selection bias.
### Aliases: selection

### ** Examples

# The data for this example come from:
# Stang A., Schmidt-Pokrzywniak A., Lehnert M., Parkin D.M., Ferlay J., Bornfeld N.
# et al.
# Population-based incidence estimates of uveal melanoma in Germany. Supplementing
# cancer registry data by case-control data.
# Eur J Cancer Prev 2006;15:165-70.
selection(matrix(c(136, 107, 297, 165),
dimnames = list(c("UM+", "UM-"), c("Mobile+", "Mobile-")),
nrow = 2, byrow = TRUE),
bias_parms = c(.94, .85, .64, .25))
selection(matrix(c(136, 107, 297, 165),
dimnames = list(c("UM+", "UM-"), c("Mobile+", "Mobile-")),
nrow = 2, byrow = TRUE),
bias_parms = 0.43)



