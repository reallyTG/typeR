library(PMwR)


### Name: Trade-Analysis
### Title: Analysing Trades: Compute Profit/Loss, Resize and more
### Aliases: close_on_first limit scale_to_unity scale_trades split_trades
###   tw_exposure

### ** Examples

n <- c(1,1,-3,-1,2)
p <- 100 + 1:length(n)
timestamp <- 1:length(n)

split_trades(n, p, timestamp)
split_trades(n, p, timestamp, TRUE)  ## almost like the original series

scale_trades(n, p, timestamp)
scale_trades(n, p, timestamp, TRUE)  ## each _trade_ gets scaled



