library(coreSim)


### Name: b_sim
### Title: Simulate coefficients from a GLM by making draws from the
###   multivariate normal distribution
### Aliases: b_sim

### ** Examples

library(car)

# Estimate model
m1 <- lm(prestige ~ education + type, data = Prestige)

# Create fitted values
prestige_sims <- b_sim(m1)

# Manually supply coefficient means and covariance matrix
coefs <- coef(m1)
vcov_matrix <- vcov(m1)

prestige_sims_manual <- b_sim(mu = coefs, Sigma = vcov_matrix)




