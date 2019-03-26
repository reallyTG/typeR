library(purrr)


### Name: rate-helpers
### Title: Create delaying rate settings
### Aliases: rate-helpers rate_delay rate_backoff is_rate

### ** Examples

# A delay rate waits the same amount of time:
rate <- rate_delay(0.02)
for (i in 1:3) rate_sleep(rate, quiet = FALSE)

# A backoff rate waits exponentially longer each time, with random
# jitter by default:
rate <- rate_backoff(pause_base = 0.2, pause_min = 0.005)
for (i in 1:3) rate_sleep(rate, quiet = FALSE)



