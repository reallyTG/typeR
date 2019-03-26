library(simglm)


### Name: sim_glm
### Title: Master generalized simulation function.
### Aliases: sim_glm

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
  cov_param = cov_param, n = n, data_str = "single", outcome_type = 'logistic')
  
  # counts
temp_single <- sim_glm(fixed = fixed, fixed_param = fixed_param, 
  cov_param = cov_param, n = n, data_str = "single", outcome_type = 'poisson')

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

 # counts 
temp_long <- sim_glm(fixed, random, random3 = NULL, fixed_param, 
random_param, random_param3 = NULL,
 cov_param, k = NULL, n, p, data_str = data_str, outcome_type = 'poisson')

# Three level example
fixed <- ~1 + time + diff + act + actClust + time:act
random <- ~1 + time + diff
random3 <- ~ 1 + time
fixed_param <- c(0.1, -0.2, 0.15, 0.5, -0.02, 0.03)
random_param <- list(random_var = c(7, 4, 2), rand_gen = 'rnorm')
random_param3 <- list(random_var = c(4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'), 
   var_type = c("level1", "level2", "level3"),
   opts = list(list(mean = 0, sd = 1.5),
   list(mean = 0, sd = 4),
   list(mean = 0, sd = 2)))
k <- 10
n <- 15
p <- 10
data_str <- "long"
temp_three <- sim_glm(fixed, random, random3, fixed_param, random_param, 
  random_param3, cov_param, k,n, p, data_str = data_str, outcome_type = 'logistic')
  
  # count data sim
  temp_three <- sim_glm(fixed, random, random3, fixed_param, random_param, 
  random_param3, cov_param, k,n, p, data_str = data_str, outcome_type = 'poisson')





