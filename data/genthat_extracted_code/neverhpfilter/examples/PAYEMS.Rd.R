library(neverhpfilter)


### Name: PAYEMS
### Title: Employment Situation
### Aliases: PAYEMS
### Keywords: datasets

### ** Examples

data(PAYEMS)
tail(PAYEMS)

PAYEMS_qtr <- xts::to.quarterly(PAYEMS["1947/"], OHLC = FALSE)
log_Employment <- 100*log(PAYEMS_qtr)

employ_trend <- yth_filter(log_Employment, h = 8, p = 4, output = c("x", "trend"), 
                           family = gaussian)

main <- "Log of Employment and trend"
plot(employ_trend, grid.col = "white", legend.loc = "topleft", main = main)


employ_cycle <- yth_filter(log_Employment, h = 8, p = 4, output = c("cycle", "random"), 
                           family = gaussian)

main <- "Log of Employment cycle and random walk"
plot(employ_cycle, grid.col = "white", legend.loc = "topright", main = main)



