library(simmer.plot)


### Name: plot.mon
### Title: Plot Methods for 'simmer' Monitoring Statistics
### Aliases: plot.mon plot.arrivals plot.mon plot.attributes plot.mon
###   plot.resources plot.mon

### ** Examples

t0 <- trajectory("my trajectory") %>%
  ## add an intake activity
  seize("nurse", 1) %>%
  timeout(function() rnorm(1, 15)) %>%
  release("nurse", 1) %>%
  ## add a consultation activity
  seize("doctor", 1) %>%
  timeout(function() rnorm(1, 20)) %>%
  release("doctor", 1) %>%
  ## add a planning activity
  seize("administration", 1) %>%
  timeout(function() rnorm(1, 5)) %>%
  release("administration", 1)

env <- simmer("SuperDuperSim") %>%
  add_resource("nurse", 1) %>%
  add_resource("doctor", 2) %>%
  add_resource("administration", 1) %>%
  add_generator("patient", t0, function() rnorm(1, 10, 2)) %>%
  run(until=80)

resources <- get_mon_resources(env)
arrivals <- get_mon_arrivals(env)

plot(resources, metric="usage", "doctor", items = "server", steps = TRUE)
plot(resources, metric="utilization", c("nurse", "doctor", "administration"))
plot(arrivals, metric="waiting_time")




