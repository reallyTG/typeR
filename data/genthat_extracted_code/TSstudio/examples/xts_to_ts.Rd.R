library(TSstudio)


### Name: xts_to_ts
### Title: Converting 'xts' object to 'ts' object
### Aliases: xts_to_ts

### ** Examples


data("Michigan_CS", package = "TSstudio")
class(Michigan_CS)
ts_plot(Michigan_CS)
Michigan_CS_ts <- xts_to_ts(Michigan_CS)
ts_plot(Michigan_CS_ts)



