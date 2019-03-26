library(sweep)


### Name: sw_tidy_decomp
### Title: Coerces decomposed time-series objects to tibble format.
### Aliases: sw_tidy_decomp

### ** Examples

library(forecast)
library(sweep)

# Decompose ETS model
USAccDeaths %>%
    ets() %>%
    sw_tidy_decomp()

# Decompose STL object
USAccDeaths %>%
    stl(s.window = 'periodic') %>%
    sw_tidy_decomp()





