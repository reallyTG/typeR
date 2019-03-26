library(SimMultiCorrData)


### Name: power_norm_corr
### Title: Calculate Power Method Correlation
### Aliases: power_norm_corr
### Keywords: Fleishman, Headrick correlation,

### ** Examples

# Beta(a = 4, b = 2) Distribution
power_norm_corr(c = c(0.108304, 1.104252, -0.123347, -0.045284, 0.005014,
                      0.001285),
                method = "Polynomial")

# Switch signs on c1, c3, and c5 to get negative correlation (invalid pdf):
power_norm_corr(c = c(0.108304, -1.104252, -0.123347, 0.045284, 0.005014,
                      -0.001285),
                method = "Polynomial")




