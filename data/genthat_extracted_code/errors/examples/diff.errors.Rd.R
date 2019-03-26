library(errors)


### Name: diff.errors
### Title: Lagged Differences
### Aliases: diff.errors

### ** Examples

diff(set_errors(1:10, 0.1), 2)
diff(set_errors(1:10, 0.1), 2, 2)
x <- cumsum(cumsum(set_errors(1:10, 0.1)))
diff(x, lag = 2)
diff(x, differences = 2)




