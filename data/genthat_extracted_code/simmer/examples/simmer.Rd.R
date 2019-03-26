library(simmer)


### Name: simmer
### Title: Create a Simulator
### Aliases: simmer

### ** Examples

## a simple trajectory that prints a message
t0 <- trajectory("my trajectory") %>%
  log_("arrival generated")

## create an empty simulation environment
env <- simmer("SuperDuperSim")
env

## add a generator and attach it to the trajectory above
env %>% add_generator("dummy", t0, function() 1)

## run for some time
env %>% run(until=4.5)
env %>% now()           # current simulation time
env %>% peek()          # time for the next event
env %>% stepn()         # execute next event




