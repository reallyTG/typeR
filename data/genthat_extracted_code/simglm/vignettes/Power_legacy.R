## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(simglm)
knit_print.data.frame = function(x, ...) {
  res = paste(c('', '', kable(x, output = FALSE)), collapse = '\n')
  asis_output(res)
}

## ----singlelevel---------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.5, 1.1, 0.6, 0.9, 1.1)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 2),
                              list(mean = 0, sd = 1)))
n <- 150
error_var <- 20
with_err_gen <- 'rnorm'
pow_param <- c('(Intercept)', 'act', 'diff', 'numCourse')
alpha <- .01
pow_dist <- "t"
pow_tail <- 2
replicates <- 100
power_out <- sim_pow(fixed = fixed, fixed_param = fixed_param, 
                     cov_param = cov_param, n = n, error_var = error_var,
                     with_err_gen = with_err_gen, data_str = "single",
                     pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates)

## ----printsinglelevel----------------------------------------------------
head(power_out)

## ----standardized--------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.2, 0.4, 0.25, 0.7, 0.1)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 1),
                              list(mean = 0, sd = 1),
                              list(mean = 0, sd = 1)))
n <- 150
error_var <- 1
with_err_gen <- 'rnorm'
pow_param <- c('(Intercept)', 'act', 'diff', 'numCourse')
alpha <- .01
pow_dist <- "t"
pow_tail <- 2
replicates <- 100
power_out <- sim_pow(fixed = fixed, fixed_param = fixed_param, 
                     cov_param = cov_param,n = n, error_var = error_var,
                     with_err_gen = with_err_gen, data_str = "single",
                     pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates)
head(power_out)

## ----singlelevel_vary----------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.5, 1.1, 0.6, 0.9, 1.1)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'), 
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 2),
                              list(mean = 0, sd = 1)))
n <- NULL
error_var <- NULL
with_err_gen <- 'rnorm'
pow_param <- c('(Intercept)', 'act', 'diff', 'numCourse')
alpha <- .01
pow_dist <- "t"
pow_tail <- 2
replicates <- 10
terms_vary <- list(n = c(20, 40, 60, 80, 100), error_var = c(5, 10, 20),
                   fixed_param = list(c(0.5, 1.1, 0.6, 0.9, 1.1), 
                                      c(0.6, 1.1, 0.6, 0.9, 1.1)),
                cov_param = list(list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                                       mean = c(0, 0, 0), sd = c(2, 2, 1), 
                                  var_type = c("single", "single", "single")),
                                  list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                                       mean = c(0.5, 0, 0), sd = c(2, 2, 1), 
                                  var_type = c("single", "single", "single"))
                                  )
                   )
power_out <- sim_pow(fixed = fixed, fixed_param = fixed_param, 
                     cov_param = cov_param,
                     n = n, error_var = error_var, with_err_gen = with_err_gen, 
                     data_str = "single", pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates, terms_vary = terms_vary)

## ----misspecify----------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.5, 1.1, 0.6, 0.9, 1.1)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 2),
                              list(mean = 0, sd = 1)))
n <- 150
error_var <- 20
with_err_gen <- 'rnorm'
pow_param <- c('(Intercept)', 'act', 'diff', 'numCourse')
alpha <- .01
pow_dist <- "t"
pow_tail <- 2
replicates <- 100

lm_fit_mod <- sim_data ~ 1 + act + diff

power_out <- sim_pow(fixed = fixed, fixed_param = fixed_param, 
                     cov_param = cov_param, n = n, error_var = error_var,
                     with_err_gen = with_err_gen, data_str = "single",
                     pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates, lm_fit_mod = lm_fit_mod)
head(power_out)

## ----misspecify_vary-----------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(0.5, 1.1, 0.6, 0.9, 1.1)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 2),
                              list(mean = 0, sd = 1)))
n <- 150
error_var <- 20
with_err_gen <- 'rnorm'
pow_param <- c('(Intercept)', 'act', 'diff', 'numCourse')
alpha <- .01
pow_dist <- "t"
pow_tail <- 2
replicates <- 100

terms_vary <- list(n = c(20, 40, 60, 80, 100), error_var = c(5, 10, 20),
                   fixed_param = list(c(0.5, 1.1, 0.6, 0.9, 1.1), 
                                      c(0.6, 1.1, 0.6, 0.9, 1.1)),
                lm_fit_mod = list(sim_data ~ 1 + act + diff, 
                                  sim_data ~ 1 + act)
)

power_out <- sim_pow(fixed = fixed, fixed_param = fixed_param, 
                     cov_param = cov_param, n = n, error_var = error_var,
                     with_err_gen = with_err_gen, data_str = "single",
                     pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates, terms_vary = terms_vary)
head(power_out)

## ----three---------------------------------------------------------------
fixed <- ~1 + time + diff + act + actClust + time:act
random <- ~1 + time
random3 <- ~ 1 + time
fixed_param <- c(4, 2, 6, 2.3, 7, 0)
random_param <- list(random_var = c(7, 4), rand_gen = 'rnorm')
random_param3 <- list(random_var = c(4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("level1", "level2", "level3"),
                  opts = list(list(mean = 0, sd = 1.5),
                              list(mean = 0, sd = 4),
                              list(mean = 0, sd = 2)))
k <- 10
n <- 45
p <- 8
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
pow_param <- c('time', 'diff', 'act', 'actClust')
alpha <- .01
pow_dist <- "z"
pow_tail <- 2
replicates <- 3
power_out <- sim_pow(fixed = fixed, random = random, random3 = random3,
                     fixed_param = fixed_param,
                     random_param = random_param, 
                     random_param3 = random_param3,
                     cov_param = cov_param,
                     k = k, n = n, p = p,
                     error_var = error_var, with_err_gen = "rnorm",
                     data_str = data_str, 
                     unbal = list(level2 = FALSE, level3 = FALSE),
                     pow_param = pow_param, alpha = alpha,
                     pow_dist = pow_dist, pow_tail = pow_tail, 
                     replicates = replicates)
head(power_out)

## ----singlelogistic------------------------------------------------------
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
replicates <- 10

power_out <- sim_pow_glm(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, 
                         n = n, data_str = "single", 
                         outcome_type = 'logistic',
                         pow_param = pow_param, alpha = alpha,
                         pow_dist = pow_dist, pow_tail = pow_tail, 
                         replicates = replicates)
head(power_out)

## ----singlelogistic_vary-------------------------------------------------
fixed <- ~ 1 + act + diff
fixed_param <- c(0.1, 0.5, 0.3)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("single", "single"),
                  opts = list(list(mean = 0, sd = 5),
                              list(mean = 0, sd = 8)))
n <- NULL
pow_param <- c('(Intercept)', 'act', 'diff')
alpha <- .01
pow_dist <- "z"
pow_tail <- 2
replicates <- 10
terms_vary <- list(n = c(20, 40, 60, 80, 100),
                   fixed_param = list(c(0.5, 0.1, 0.2), 
                                      c(0.6, 0.1, 0.2)))

power_out <- sim_pow_glm(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, 
                         n = n, data_str = "single", 
                         outcome_type = 'logistic',
                         pow_param = pow_param, alpha = alpha,
                         pow_dist = pow_dist, pow_tail = pow_tail, 
                         replicates = replicates, terms_vary = terms_vary)
head(power_out)

