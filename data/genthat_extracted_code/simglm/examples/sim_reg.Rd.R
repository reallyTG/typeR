library(simglm)


### Name: sim_reg
### Title: Master continuous simulation function.
### Aliases: sim_reg

### ** Examples


# generating parameters for single level regression
fixed <- ~1 + act + diff + numCourse + act:numCourse
fixed_param <- c(2, 4, 1, 3.5, 2)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'), 
   var_type = c("single", "single", "single"),
   opts = list(list(mean = 0, sd = 4), 
   list(mean = 0, sd = 3),
   list(mean = 0, sd = 3)))
n <- 150
error_var <- 3
with_err_gen <- 'rnorm'
temp_single <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
   cov_param = cov_param, 
   n = n, error_var = error_var, with_err_gen = with_err_gen, 
   data_str = "single")
# Fitting regression to obtain parameter estimates
summary(lm(sim_data ~ 1 + act + diff + numCourse + act:numCourse, 
   data = temp_single))

# Longitudinal linear mixed model example
fixed <- ~1 + time + diff + act + time:act
random <- ~1 + time + diff
fixed_param <- c(4, 2, 6, 2.3, 7)
random_param <- list(random_var = c(7, 4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm'), 
  var_type = c("level1", "level2"),
  opts = list(list(mean = 0, sd = 1.5), 
  list(mean = 0, sd = 4)))
n <- 150
p <- 30
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
temp_long <- sim_reg(fixed, random, random3 = NULL, fixed_param, 
   random_param, random_param3 = NULL,
   cov_param, k = NULL, n, p, error_var, with_err_gen, data_str = data_str)

## fitting lmer model
library(lme4)
lmer(sim_data ~ 1 + time + diff + act + time:act + 
  (1 + time + diff | clustID), 
  data = temp_long)

# Three level example
fixed <- ~1 + time + diff + act + actClust + time:act
random <- ~1 + time + diff
random3 <- ~ 1 + time
fixed_param <- c(4, 2, 6, 2.3, 7, 0)
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
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
temp_three <- sim_reg(fixed, random, random3, fixed_param, random_param, 
random_param3, cov_param, k,n, p, error_var, with_err_gen, 
   data_str = data_str)

library(lme4)
lmer(sim_data ~ 1 + time + diff + act + actClust + time:act + 
   (1 + time + diff | clustID) +  
   (1 | clust3ID), data = temp_three)




