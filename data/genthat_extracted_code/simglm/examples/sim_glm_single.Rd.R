library(simglm)


### Name: sim_glm_single
### Title: Simulation single level logistic regression model
### Aliases: sim_glm_single

### ** Examples

# generating parameters for single level regression
set.seed(2)
fixed <- ~1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.1, -0.2, 0.15, 0.5, -0.02)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
   var_type = c("single", "single", "single"),
   opts = list(list(mean = 0, sd = 4),
   list(mean = 0, sd = 3),
   list(mean = 0, sd = 3)))
n <- 150
temp_single <- sim_glm(fixed = fixed, fixed_param = fixed_param, 
  cov_param = cov_param, n = n, data_str = "single", 
  outcome_type = 'logistic')
  



