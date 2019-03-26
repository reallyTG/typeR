library(sweep)


### Name: tidiers_stl
### Title: Tidying methods for STL (Seasonal, Trend, Level) decomposition
###   of time series
### Aliases: tidiers_stl sw_tidy.stl sw_tidy_decomp.stl sw_tidy_decomp.stlm

### ** Examples

library(forecast)
library(sweep)

fit_stl <- USAccDeaths %>%
    stl(s.window = "periodic")

sw_tidy_decomp(fit_stl)




