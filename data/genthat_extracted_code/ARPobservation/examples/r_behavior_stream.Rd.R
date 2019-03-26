library(ARPobservation)


### Name: r_behavior_stream
### Title: Generates random behavior streams
### Aliases: r_behavior_stream

### ** Examples

# default equilibrium initial conditions
r_behavior_stream(n = 5, mu = 3, lambda = 10,
                  F_event = F_exp(), F_interim = F_exp(),
                  stream_length = 100)

# non-equilibrium initial conditions
r_behavior_stream(n = 5, mu = 3, lambda = 10,
                  F_event = F_gam(3), F_interim = F_gam(3),
                  stream_length = 100,
                  equilibrium = FALSE, p0 = 0.5)



