library(pop)


### Name: transition
### Title: transition objects
### Aliases: *.transition is.transition parameters.transition
###   parameters<-.transition print.transition tr transition

### ** Examples

# 50/50 chance of a larva emerging from an egg
hatching <- tr(larva ~ egg, p(0.5))

# three eggs laid per adult per time step
fecundity <- tr(egg ~ adult, r(3))

# 0.1 probability of a larva pupating into an adult
pupa <- tr(adult ~ larva, p(0.1))

# print method
print(pupa)

# make a compound transition to include a probability of laying eggs
prob_laying <- tr(egg ~ adult, p(0.6))
(recruitment <- prob_laying * fecundity)

# extract the transfun parameters
(param_pupa <- parameters(pupa))
(param_recruitment <- parameters(recruitment))

# update the parameters of these transfuns
param_pupa$p <- 0.6
parameters(pupa) <- param_pupa
parameters(pupa)

param_recruitment$r <- 15
parameters(recruitment) <- param_recruitment
parameters(recruitment)



