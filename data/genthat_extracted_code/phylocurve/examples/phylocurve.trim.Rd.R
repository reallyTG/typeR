library(phylocurve)


### Name: phylocurve.trim
### Title: Trim aligned curves
### Aliases: phylocurve.trim

### ** Examples

# NOT RUN (takes several minutes)
# x_length <- 50
# nspecies <- 25
#sim_data <- sim.curves(nspecies = nspecies,x_length = x_length)
#
# Perform ancestral curve reconstruction without any assumptions about function shape
# P <- phylocurve.generalized(tree = sim_data$tree,
#  X = sim_data$data$x[1:x_length],Y = t(matrix(sim_data$data$y,
#  nrow = x_length,dimnames = list(1:x_length,sim_data$tree$tip.label))))
#
# Data might need trimming for values where there is no variation
# plot(P$anc_X,P$anc_Y)
#
# P.trimmed <- phylocurve.trim(phylocurve.generalized = P,min_X = 4,max_X = 8)



