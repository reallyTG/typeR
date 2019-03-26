library(ratelimitr)


### Name: reset
### Title: Re-create a rate-limited function
### Aliases: reset

### ** Examples

f <- function() NULL
f_lim <- limit_rate(f, rate(n = 1, period = .1))
f_lim() ## the next call to f_lim will trigger the rate limit

f_lim2 <- reset(f_lim) ## but f_lim2 has a fresh start

## f_lim2 behaves as though no calls have been made
system.time(f_lim2())

## while f_lim is still constrained
system.time(f_lim())




