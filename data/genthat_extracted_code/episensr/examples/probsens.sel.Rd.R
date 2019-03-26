library(episensr)


### Name: probsens.sel
### Title: Probabilistic sensitivity analysis for selection bias.
### Aliases: probsens.sel

### ** Examples

# The data for this example come from:
# Stang A., Schmidt-Pokrzywniak A., Lehnert M., Parkin D.M., Ferlay J., Bornfeld N. et al.
# Population-based incidence estimates of uveal melanoma in Germany.
# Supplementing cancer registry data by case-control data.
# Eur J Cancer Prev 2006;15:165-70.
set.seed(123)
probsens.sel(matrix(c(136, 107, 297, 165),
dimnames = list(c("Melanoma+", "Melanoma-"), c("Mobile+", "Mobile-")), nrow = 2, byrow = TRUE),
reps = 20000,
or.parms = list("triangular", c(.35, 1.1, .43)))



