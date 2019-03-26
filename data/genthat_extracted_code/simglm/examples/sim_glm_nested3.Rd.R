library(simglm)


### Name: sim_glm_nested3
### Title: Function to simulate three level nested data
### Aliases: sim_glm_nested3

### ** Examples

# Three level example
fixed <- ~1 + time + diff + act + actClust + time:act
random <- ~1 + time + diff
random3 <- ~ 1 + time
fixed_param <- c(0.1, -0.2, 0.15, 0.5, -0.02, 0.04)
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
  random_param3, cov_param, k,n, p, data_str = data_str, 
  outcome_type = 'logistic')
  



