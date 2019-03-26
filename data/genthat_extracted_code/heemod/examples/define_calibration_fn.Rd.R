library(heemod)


### Name: define_calibration_fn
### Title: Define Calibration Function
### Aliases: define_calibration_fn

### ** Examples

example("run_model")

f <- define_calibration_fn(
  type = c("count", "count", "value"),
  strategy_names = c("I", "I", "II"),
  element_names = c("A", "B", "ly"),
  cycles = c(3, 5, 9),
  groups = c(1, 1, 2),
  aggreg_fn = mean
)




