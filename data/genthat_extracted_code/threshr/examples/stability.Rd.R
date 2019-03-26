library(threshr)


### Name: stability
### Title: Generalized Pareto parameter estimate stability
### Aliases: stability

### ** Examples

# Set a vector of thresholds
u_vec_gom <- quantile(gom, probs = seq(0, 0.95, by = 0.05))

# Symmetric confidence intervals
gom_stab <- stability(data = gom, u_vec = u_vec_gom)
plot(gom_stab)

# Profile-likelihood-based confidence intervals
gom_stab <- stability(data = gom, u_vec = u_vec_gom, prof = TRUE)
plot(gom_stab)



