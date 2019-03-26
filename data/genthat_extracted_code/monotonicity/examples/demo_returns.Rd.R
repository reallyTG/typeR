library(monotonicity)


### Name: demo_returns
### Title: Asset returns used in Ang, Chen and Xing (RFS, 2006), sorted
###   into ten portfolios.
### Aliases: demo_returns

### ** Examples

## load demo data
data(demo_returns)

## calculate the mean difference return between the top and bottom portfolio
mean(demo_returns[, ncol(demo_returns)] - demo_returns[, 1])



