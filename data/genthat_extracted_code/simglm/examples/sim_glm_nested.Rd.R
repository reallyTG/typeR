library(simglm)


### Name: sim_glm_nested
### Title: Simulate two level logistic regression model
### Aliases: sim_glm_nested

### ** Examples

# Longitudinal linear mixed model example
fixed <- ~1 + time + diff + act + time:act
random <- ~1 + time + diff
fixed_param <- c(0.1, -0.2, 0.15, 0.5, -0.02)
random_param <- list(random_var = c(7, 4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
   var_type = c("level1", "level2"),
   opts = list(list(mean = 0, sd = 1.5),
   list(mean = 0, sd = 4)))
n <- 150
p <- 30
data_str <- "long"
temp_long <- sim_glm(fixed, random, random3 = NULL, fixed_param, 
random_param, random_param3 = NULL,
 cov_param, k = NULL, n, p, data_str = data_str, outcome_type = 'logistic')



