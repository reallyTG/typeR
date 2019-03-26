library(SimInf)


### Name: run_outer
### Title: Run 'SimInf_model' on scaled parameters
### Aliases: run_outer

### ** Examples

## Not run: 
##D ## Create an SIR-model with 500 nodes of 99 susceptible individuals
##D ## and one infected individuals.
##D u0 <- data.frame(S = rep(99, 500), I = rep(1, 500), R = rep(0, 500))
##D model <- SIR(u0, 1:75, beta = 0.16, gamma = 0.077)
##D 
##D ## Define scaling parameters
##D x <- seq(from = 0.2, to = 1.8, by = 0.05)
##D y <- seq(from = 0.2, to = 1.1, by = 0.05)
##D 
##D ## Utility function to run the model and estimate the population
##D ## prevalence on day 75.
##D pop_prev <- function(model) {
##D     result <- run(model)
##D     prevalence(result, I~., type = "pop", as.is = TRUE)[75]
##D }
##D 
##D ## Scale 'gamma' with 'y' and 'beta' with 'x' and
##D ## run the model and determine the population prevalence on day
##D ## 500. For each combination of 'x' and 'y', the model parameters
##D ## are scaled and the function 'pop_prev' called with the
##D ## perturbed model.
##D pop <- run_outer(x, y, model, gamma ~ beta, pop_prev)
##D 
##D ## Plot result
##D contour(x * model@gdata["beta"], y * model@gdata["gamma"],
##D         pop, method = "edge", bty = "l")
##D 
##D ## Utility function to run the model and estimate the node
##D ## prevalence on day 75.
##D node_prev <- function(model) {
##D     result <- run(model)
##D     prevalence(result, I~., type = "nop", as.is = TRUE)[75]
##D }
##D 
##D ## Scale 'gamma' with 'y' and 'beta' with 'x' and
##D ## run the model and determine the node prevalence on day
##D ## 500. For each combination of 'x' and 'y', the model parameters
##D ## are scaled and the function 'node_prev' called with the
##D ## perturbed model.
##D nop <- run_outer(x, y, model, gamma ~ beta, node_prev)
##D 
##D ## Plot result
##D contour(x * model@gdata["beta"], y * model@gdata["gamma"],
##D         nop, method = "edge", bty = "l")
## End(Not run)



