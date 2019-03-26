library(phylocurve)


### Name: sim.curves
### Title: Simulate function-valued curve evolution
### Aliases: sim.curves

### ** Examples

# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# perform ancestral curve reconstruction
anc_recon <- phylocurve(y~x,tree = sim_data$tree,data = sim_data$data)

# get tip coefficients and aligned function data
tip.coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip.coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)



