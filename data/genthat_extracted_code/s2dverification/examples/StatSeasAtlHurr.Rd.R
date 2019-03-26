library(s2dverification)


### Name: StatSeasAtlHurr
### Title: Compute estimate of seasonal mean of Atlantic hurricane activity
### Aliases: StatSeasAtlHurr
### Keywords: datagen

### ** Examples

# Let AtlAno represents 5 different 5-year forecasts of seasonally averaged 
# Atlantic sea surface temperature anomalies.
AtlAno <- matrix(c(-0.31, -0.36, 0.26, -0.16, -0.16, 
                   -0.06, -0.22, -0.31, -0.36, -0.39, 
                    0.20, -0.14, 0.12, 0.22, 0.02,
                   -0.28, 0.26, -0.10, 0.18, 0.33, 
                    0.45, 0.46, 0.04, 0.12, 0.21), 
                    nrow = 5, ncol = 5)
# Let TropAno represents 5 corresponding 5-year forecasts of seasonally averaged 
# tropical sea surface temperature anomalies.
TropAno <- matrix(c(-0.22, -.13, 0.07, -0.16, -0.15,
                     0.00,  -0.03, -0.22, -0.13, -0.10,
                     0.07, -0.07, 0.17, 0.10, -0.15,
                    -0.01, 0.08, 0.07, 0.17, 0.13,
                     0.16, 0.15, -0.09, 0.03, 0.27),
                     nrow = 5, ncol = 5)
# The seasonal average of hurricanes for each of the five forecasted years, 
# for each forecast, would then be given by
hr_count <- StatSeasAtlHurr(atlano = AtlAno, 
                            tropano = TropAno, 
                            hrvar = 'HR')
print(hr_count$mean)



