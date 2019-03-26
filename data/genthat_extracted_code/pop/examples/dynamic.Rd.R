library(pop)


### Name: dynamic
### Title: dynamic objects
### Aliases: as.matrix.dynamic dynamic is.dynamic parameters.dynamic
###   parameters<-.dynamic plot.dynamic print.dynamic states

### ** Examples

# define transitions for a simple three-stage system (with implicit
# mortality):
stasis_egg <- tr(egg ~ egg, p(0.4))
stasis_larva <- tr(larva ~ larva, p(0.3))
stasis_adult <- tr(adult ~ adult, p(0.8))
hatching <- tr(larva ~ egg, p(0.5))
fecundity <- tr(egg ~ adult, r(3))
pupation <- tr(adult ~ larva, p(0.2))

# combine these into separate dynamics
stasis <- dynamic(stasis_egg,
                  stasis_larva,
                  stasis_adult)
growth <- dynamic(hatching,
                  pupation)
reproduction <- dynamic(fecundity)

# combine these into one dynamic (the same as listing all the transitions
# separately)
all <- dynamic(stasis, growth, reproduction)

# plot these
plot(stasis)
plot(growth)
plot(all)

# get component states
states(all)

# print method
print(all)

# convert to a transition matrix
as.matrix(all)
# extract the parameters
(param_stasis <- parameters(stasis))
(param_all <- parameters(all))

# update the parameters of these transfuns
param_stasis$stasis_egg$p <- 0.6
parameters(stasis) <- param_stasis
parameters(stasis)

param_all$fecundity$r <- 15
parameters(all) <- param_all
parameters(all)



