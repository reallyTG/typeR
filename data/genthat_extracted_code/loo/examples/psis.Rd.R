library(loo)


### Name: psis
### Title: Pareto smoothed importance sampling (PSIS)
### Aliases: psis psis.array psis.matrix psis.default weights.psis

### ** Examples

log_ratios <- -1 * example_loglik_array()
r_eff <- relative_eff(exp(log_ratios))
psis_result <- psis(log_ratios, r_eff = r_eff)
str(psis_result)
plot(psis_result)

# extract smoothed weights
lw <- weights(psis_result) # default args are log=TRUE, normalize=TRUE
ulw <- weights(psis_result, normalize=FALSE) # unnormalized log-weights

w <- weights(psis_result, log=FALSE) # normalized weights (not log-weights)
uw <- weights(psis_result, log=FALSE, normalize = FALSE) # unnormalized weights






