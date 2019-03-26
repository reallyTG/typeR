library(prob)


### Name: sim
### Title: Simulate Draws from a Sample Space
### Aliases: sim sim.default sim.ps
### Keywords: misc

### ** Examples

S <- cards(makespace = TRUE)
sim(S, ntrials = 5)

T <- urnsamples(S, 2)
U <- probspace(T)
sim(U, ntrials = 4)



