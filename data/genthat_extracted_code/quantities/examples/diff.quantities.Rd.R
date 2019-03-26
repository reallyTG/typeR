library(quantities)


### Name: diff.quantities
### Title: Lagged Differences
### Aliases: diff.quantities

### ** Examples

diff(set_quantities(1:10, m/s, 0.1), 2)
diff(set_quantities(1:10, m/s, 0.1), 2, 2)
x <- cumsum(cumsum(set_quantities(1:10, m/s, 0.1)))
diff(x, lag = 2)
diff(x, differences = 2)




