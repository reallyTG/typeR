library(simglm)


### Name: sim_pow_glm
### Title: Master power simulation function for glm models.
### Aliases: sim_pow_glm

### ** Examples


# single level dichotomous (glm) example
fixed <- ~ 1 + act + diff
fixed_param <- c(0.1, 0.5, 0.3)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("single", "single"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 4)))
n <- 50
pow_param <- c('(Intercept)', 'act', 'diff')
alpha <- .01
pow_dist <- "z"
pow_tail <- 2
replicates <- 2

power_out <- sim_pow_glm(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, 
                         n = n, data_str = "single", 
                         outcome_type = 'logistic', 
                         pow_param = pow_param, alpha = alpha,
                         pow_dist = pow_dist, pow_tail = pow_tail, 
                         replicates = replicates, raw_power = FALSE)




