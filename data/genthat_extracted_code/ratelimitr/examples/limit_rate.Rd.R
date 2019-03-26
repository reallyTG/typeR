library(ratelimitr)


### Name: limit_rate
### Title: Limit the rate at which a function will execute
### Aliases: limit_rate limit_rate.list limit_rate.function_list
###   limit_rate.function

### ** Examples

## limiting a single function
f <- limit_rate(Sys.time, rate(n = 5, period = .1))
res <- replicate(10, f())
## show the elapsed time between each function call:
round(res[-1] - head(res, -1), 3)

## for multiple functions, make sure the list is named:
f <- function() 1
g <- function() 2
limited <- limit_rate(list(f = f, g = g), rate(n = 1, period = .1))
system.time({limited$f(); limited$g()})




