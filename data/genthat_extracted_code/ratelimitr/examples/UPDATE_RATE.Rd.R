library(ratelimitr)


### Name: UPDATE_RATE
### Title: Update the rate limit of an existing rate limited function
### Aliases: UPDATE_RATE

### ** Examples

f <- function() NULL
f_lim <- limit_rate(f, rate(n = 1, period = .1))

# update the rate limits to 2 calls per .1 second
UPDATE_RATE(f_lim, rate(n = 2, period = .1))




