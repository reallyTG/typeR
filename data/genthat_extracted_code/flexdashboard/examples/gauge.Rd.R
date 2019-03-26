library(flexdashboard)


### Name: gauge
### Title: Create a gauge component for a dashboard.
### Aliases: gauge gaugeSectors

### ** Examples

library(flexdashboard)

gauge(42, min = 0, max = 100, symbol = '%', gaugeSectors(
  success = c(80, 100), warning = c(40, 79), danger = c(0, 39)
))




