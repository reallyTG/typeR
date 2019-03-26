library(simmer)


### Name: generators
### Title: Convenience Functions for Generators
### Aliases: generators at from to from_to when_activated

### ** Examples

## common to all examples below
# some trajectory
t0 <- trajectory() %>%
  timeout(0)
# some distribution
distr <- function() runif(1, 1, 2)

# arrivals at 0, 1, 10, 30, 40 and 43
simmer() %>%
  add_generator("dummy", t0, at(0, c(1,10,30), 40, 43)) %>%
  run(100) %>%
  get_mon_arrivals()

# apply distribution starting at 5 (and no end)
simmer() %>%
  add_generator("dummy", t0, from(5, distr)) %>%
  run(10) %>%
  get_mon_arrivals()

# apply distribution until 5 (starting at 0)
simmer() %>%
  add_generator("dummy", t0, to(5, distr)) %>%
  run(10) %>%
  get_mon_arrivals()

# apply distribution from 8 to 16 h every 24 h:
simmer() %>%
  add_generator("dummy", t0, from_to(8, 16, distr, every=24)) %>%
  run(48) %>%
  get_mon_arrivals()

# triggering arrivals on demand from a trajectory
t1 <- trajectory() %>%
  activate("dummy")

simmer() %>%
  add_generator("dummy", t0, when_activated()) %>%
  add_generator("trigger", t1, at(2)) %>%
  run() %>%
  get_mon_arrivals()




