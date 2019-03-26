library(sweep)


### Name: sw_sweep
### Title: Tidy forecast objects
### Aliases: sw_sweep

### ** Examples

library(forecast)
library(sweep)

# ETS forecasts
USAccDeaths %>%
    ets() %>%
    forecast(level = c(80, 95, 99)) %>%
    sw_sweep()





