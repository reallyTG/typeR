library(neverhpfilter)


### Name: SP500
### Title: U.S. Stock Markets and CAPE Ratio
### Aliases: SP500
### Keywords: datasets

### ** Examples

data(SP500)

SP500_qtr <- xts::to.quarterly(SP500$SP500, OHLC = FALSE)
log_SP500 <- 100*log(SP500_qtr)

SP500_trend <- yth_filter(log_SP500, h = 8, p = 4, output = c("x", "trend"), 
                          family = gaussian)

main <- "Log of SP500 and trend"
plot(SP500_trend, grid.col = "white", legend.loc = "topleft", main = main)


SP500cycle <- yth_filter(log_SP500["1900/"], h = 8, p = 4, 
              output = c("cycle", "random"), family = gaussian)

main <- "Log of SP500 cycle and random walk"
plot(SP500cycle, grid.col = "white", legend.loc = "topright", main = main)



