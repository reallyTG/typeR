library(simglm)


### Name: sim_reg_single
### Title: Master function to simulate single level data.
### Aliases: sim_reg_single

### ** Examples

#' # generating parameters for single level regression
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
   



