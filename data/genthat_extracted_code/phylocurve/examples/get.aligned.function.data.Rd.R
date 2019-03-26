library(phylocurve)


### Name: get.aligned.function.data
### Title: Estimate aligned data for function-valued traits
### Aliases: get.aligned.function.data

### ** Examples

# simulate evolution of a function-valued trait (glm with logit link)
sim_data <- sim.curves()

# get tip coefficients and aligned function data
tip.coefficients <- get.tip.coefficients(formula = y~x,tree = sim_data$tree,data = sim_data$data)
data <- get.aligned.function.data(tip.coefficients)

# estimate evolutionary rates
evo.model.fitted <- evo.model(sim_data$tree,data)



