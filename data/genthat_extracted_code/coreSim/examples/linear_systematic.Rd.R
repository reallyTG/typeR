library(coreSim)


### Name: linear_systematic
### Title: Find the systematic component in the linear form for fitted
###   values in across each simulation (note: largely for internal use by
###   'qi_builder')
### Aliases: linear_systematic

### ** Examples

library(car)

# Estimate model
m1 <- lm(prestige ~ education + type, data = Prestige)

# Create fitted values
fitted_df <- expand.grid(education = 6:16, typewc = 1)

# Simulate coefficients
m1_sims <- b_sim(m1, nsim = 1000)

# Find linear systematic component for fitted values
ls <- linear_systematic(b_sims = m1_sims, newdata = fitted_df)




