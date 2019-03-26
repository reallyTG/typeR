library(simglm)


### Name: sim_reg_nested
### Title: Function to simulate nested data
### Aliases: sim_reg_nested

### ** Examples

#' # Longitudinal linear mixed model example
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




