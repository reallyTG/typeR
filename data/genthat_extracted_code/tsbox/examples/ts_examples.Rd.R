library(tsbox)


### Name: ts_examples
### Title: Principal Components, Dygraphs, Forecasts, Seasonal Adjustment
### Aliases: ts_examples ts_prcomp ts_examples ts_dygraphs ts_examples
###   ts_forecast ts_examples ts_seas

### ** Examples

## No test: 
ts_plot(
  ts_scale(ts_c(
    Male = mdeaths, 
    Female = fdeaths,
    `First principal compenent` = -ts_prcomp(ts_c(mdeaths, fdeaths))[, 1]
  )),
  title = "Deaths from lung diseases", 
  subtitle = "Normalized values"
)

ts_plot(ts_c(
  male = mdeaths, female = fdeaths,
  ts_forecast(ts_c(`male (fct)` = mdeaths,  `female (fct)` = fdeaths))),
  title = "Deaths from lung diseases", 
  subtitle = "Exponential smoothing forecast"
)

ts_plot(
  `Raw series` = AirPassengers,
  `Adjusted series` = ts_seas(AirPassengers),
  title = "Airline passengers", 
  subtitle = "X-13 seasonal adjustment"
)


ts_dygraphs(ts_c(mdeaths, EuStockMarkets))
## End(No test)



