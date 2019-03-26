library(gridsampler)


### Name: sim_n_persons
### Title: Simulate n persons
### Aliases: sim_n_persons

### ** Examples

sim_n_persons(dexp(1:30, .05), n = 2, a = 10)
sim_n_persons(dexp(1:30, .05), n = 2, a = c(1, 30))
sim_n_persons(dexp(1:30, .05), n = 2, a = c(1, 30), ap = c(1,4))
sim_n_persons(dexp(1:30, .05), n = 2, a = 1:5, ap = c(1,1,2,2,3))




