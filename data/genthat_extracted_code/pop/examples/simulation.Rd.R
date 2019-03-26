library(pop)


### Name: simulation
### Title: Stochastic Simulation
### Aliases: is.simulation plot.simulation simulation

### ** Examples

# set up a three-stage model
stasis_egg <- tr(egg ~ egg, p(0.6))
stasis_larva <- tr(larva ~ larva, p(0.4))
stasis_adult <- tr(adult ~ adult, p(0.9))
hatching <- tr(larva ~ egg, p(0.35))
fecundity <- tr(egg ~ adult, r(20))
pupation <- tr(adult ~ larva, p(0.2))

pd <- dynamic(stasis_egg,
              stasis_larva,
              stasis_adult,
              hatching,
              pupation,
              fecundity)

population <- data.frame(egg = 1200, larva = 250, adult = 50)

# simulate for 50 timesteps, 30 times
sim <- simulation(dynamic = pd,
                  population = population,
                  timesteps = 50,
                  replicates = 30,
                  ncores = 1)

is.simulation(sim)
par(mfrow = c(3, 1))
plot(sim)



