library(phylocurve)


### Name: phylocurve-package
### Title: Phylogenetic Comparative Methods for Function-Valued and Other
###   High-Dimensional Traits
### Aliases: phylocurve-package
### Keywords: phylogenetic comparative method ancestral state
###   reconstruction function-valued traits infnite-dimensional traits
###   evolution of tolerance reaction norms phenotypic plasticity
###   dose-response curves phylogenetic signal PGLS

### ** Examples

require(phytools)

# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# perform ancestral curve reconstruction
anc_recon <- phylocurve(y~x,tree = sim_data$tree,data = sim_data$data)

# get tip coefficients and aligned function data
tip_coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip_coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)



