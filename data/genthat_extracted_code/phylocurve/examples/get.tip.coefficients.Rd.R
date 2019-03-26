library(phylocurve)


### Name: get.tip.coefficients
### Title: Estimate regression coefficients for tip species curves
### Aliases: get.tip.coefficients

### ** Examples

# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# get tip coefficients and aligned function data
tip.coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip.coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)



