library(coreSim)


### Name: qi_slimmer
### Title: Find maximum, minimum, and median values for each scenario found
###   using 'qi_builder'
### Aliases: qi_slimmer

### ** Examples

library(car)

# Normal linear model
m1 <- lm(prestige ~ education + type, data = Prestige)

# Simulate coefficients
m1_sims <- b_sim(m1)

# Create fitted values
fitted_df <- expand.grid(education = 6:16, typewc = 1)

# Find predicted outcomes (95% central interval, by default)
linear_qi <- qi_builder(b_sims = m1_sims, newdata = fitted_df, slim = FALSE)

# Slim data set
linear_slim <- qi_slimmer(linear_qi)




