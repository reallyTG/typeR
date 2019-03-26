library(sweep)


### Name: tidiers_decomposed_ts
### Title: Tidying methods for decomposed time series
### Aliases: tidiers_decomposed_ts sw_tidy_decomp.decomposed.ts

### ** Examples

library(forecast)
library(sweep)

fit_decomposed <- USAccDeaths %>%
    decompose()

sw_tidy_decomp(fit_decomposed)




