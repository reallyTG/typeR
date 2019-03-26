library(pltesim)


### Name: plte_builder
### Title: Create simulations for long-term effects in models with temporal
###   dependence
### Aliases: plte_builder

### ** Examples

data('negative')

# BTSCS set the data
neg_set <- btscs(df = negative, event = 'y', t_var = 'tim',
                cs_unit = 'group', pad_ts = FALSE)

# Create temporal dependence variable
neg_set$t <- neg_set$spell + 1

m1 <- glm(y ~ x + t + I(t^2) + I(t^3),
          family = binomial(link = 'logit'), data = neg_set)

# Create fitted counterfactual
counterfactual <- data.frame(x = 0.5)

# Permanent counterfactual, one event
sim1 <- plte_builder(obj = m1, obj_tvar = 't',
                     cf = counterfactual, t_points = c(13, 25))

# Multiple events
sim2 <- plte_builder(obj = m1, obj_tvar = 't',
                     cf = counterfactual, t_points = c(13, 18, 25))

# One-time counterfactual
sim3 <- plte_builder(obj = m1, obj_tvar = 't',
                     cf = counterfactual, t_points = c(13, 25),
                     cf_duration = 'one-time')

# Temporary (4 period counterfactual)
sim4 <- plte_builder(obj = m1, obj_tvar = 't',
                     cf = counterfactual, t_points = c(13, 25),
                     cf_duration = 4)

# Custom baseline scenario
# Note: the second row is the custom baseline
counterfactual_baseline <- data.frame(x = c(1, 0.5))

sim5 <- plte_builder(obj = m1, obj_tvar = 't', cf_duration = 4,
                     cf = counterfactual_baseline, t_points = c(13, 25))

# Time splines
library(splines)
m2 <- glm(y ~ x + bs(t, degree = 3), family = binomial(link = 'logit'),
          data = neg_set)

sim6 <- plte_builder(obj = m2, obj_tvar = 't', cf_duration = 4,
                     cf = counterfactual, t_points = c(13, 25))




