library(phylocurve)


### Name: phylocurve
### Title: Ancestral curve reconstruction for logistic regression (glm with
###   logit link)
### Aliases: phylocurve

### ** Examples

# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# perform ancestral curve reconstruction
anc_recon <- phylocurve(y~x,tree = sim_data$tree,data = sim_data$data)

# get tip coefficients and aligned function data
tip_coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip_coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)



