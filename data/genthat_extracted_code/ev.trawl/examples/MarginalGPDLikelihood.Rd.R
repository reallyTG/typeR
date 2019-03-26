library(ev.trawl)


### Name: MarginalGPDLikelihood
### Title: Computes Generalised Pareto (log-)likelihood on non-zero
###   exceedances under independence.
### Aliases: MarginalGPDLikelihood

### ** Examples

times <- c(1,2,3,4,5)
values <- c(2,0,3,4,0)
delta <- 2
fixed_names <- c("alpha", "kappa")
params <- c(3.4, 0.1)
fixed_params <- c(2.0, 4.3)
model_vars_names <- c("alpha", "beta", "rho", "kappa")
MarginalGPDLikelihood(values, fixed_names, fixed_params, params, model_vars_names)




