library(tsibble)


### Name: tsibble-package
### Title: tsibble: tidy temporal data frames and tools
### Aliases: tsibble-package

### ** Examples

# create a tsibble w/o a key ----
tsibble(
  date = as.Date("2017-01-01") + 0:9,
  value = rnorm(10)
)

# create a tsibble with one key ----
tsibble(
  qtr = rep(yearquarter("2010-01") + 0:9, 3),
  group = rep(c("x", "y", "z"), each = 10),
  value = rnorm(30),
  key = id(group)
)



