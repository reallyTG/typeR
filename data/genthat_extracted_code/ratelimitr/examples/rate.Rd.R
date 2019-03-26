library(ratelimitr)


### Name: rate
### Title: Create a new rate
### Aliases: rate

### ** Examples

## a function
f <- function() NULL

## limit f to 10 calls per second
limited_f <- limit_rate(f, rate(n = 10, period = 1))




