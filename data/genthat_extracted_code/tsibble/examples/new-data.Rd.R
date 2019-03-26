library(tsibble)


### Name: new_data
### Title: New tsibble data and append new observations to a tsibble
### Aliases: new_data new_data.tbl_ts append_row append_case

### ** Examples

new_data(pedestrian)
new_data(pedestrian, keep_all = TRUE)
new_data(pedestrian, n = 3)
tsbl <- tsibble(
  date = rep(as.Date("2017-01-01") + 0:2, each = 2), 
  group = rep(letters[1:2], 3),
  value = rnorm(6),
  key = id(group)
)
append_row(tsbl)
append_row(tsbl, n = 2)



