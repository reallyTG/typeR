## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(simglm)
knit_print.data.frame = function(x, ...) {
  res = paste(c('', '', kable(x, output = FALSE)), collapse = '\n')
  asis_output(res)
}

## ----singlelogistic------------------------------------------------------
fixed <- ~ 1 + act + diff
fixed_param <- c(2, 0.5, 0.3)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("single", "single"),
                  opts = list(list(mean = 0, sd = 4),
                              list(mean = 0, sd = 3)))
n <- 150

temp_single <- sim_glm(fixed = fixed, fixed_param = fixed_param, 
                       cov_param = cov_param, 
                       n = n, data_str = "single", outcome_type = 'logistic')
head(temp_single, n = 5)

## ----twologistic---------------------------------------------------------
# Longitudinal linear mixed model example
fixed <- ~1 + diff + act
random <- ~1 
fixed_param <- c(2, 0.5, 0.3)
random_param <- list(random_var = 7, rand_gen = "rnorm", ther_sim = TRUE)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("level1", "level2"),
                  opts = list(list(mean = 0, sd = 2),
                              list(mean = 0, sd = 1.4)))
n <- 150
p <- 30
data_str <- "cross"
temp_cross <- sim_glm(fixed, random, random3 = NULL, fixed_param,
                     random_param, random_param3 = NULL,
                     cov_param, k = NULL, n, p,
                     data_str = data_str, outcome_type = 'logistic')
head(temp_cross, n = 5)

## ----threelogistic-------------------------------------------------------
fixed <- ~1 + diff + act + actClust
random <- ~1
random3 <- ~ 1
fixed_param <- c(4, 0.8, 0.15, 1.1)
random_param <- list(random_var = 7, rand_gen = "rnorm")
random_param3 <- list(random_var = 4, rand_gen = "rnorm")
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("level1", "level2", "level3"),
                  opts = list(list(mean = 0, sd = 1.5),
                              list(mean = 0, sd = 4),
                              list(mean = 0, sd = 2)))
k <- 10
n <- 150
p <- 30
data_str <- "cross"
temp_three <- sim_glm(fixed, random, random3, fixed_param, random_param,
                      random_param3, cov_param, k, n, p, data_str = data_str,
                      outcome_type = 'logistic')
head(temp_three, n = 5)

## ----count_single--------------------------------------------------------
fixed <- ~ 1 + act + diff
fixed_param <- c(-0.5, 0.5, 0.3)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("single", "single"),
                  opts = list(list(mean = 0, sd = 4),
                              list(mean = 0, sd = 3)))
n <- 150

temp_single <- sim_glm(fixed = fixed, fixed_param = fixed_param, 
                       cov_param = cov_param, 
                       n = n, data_str = "single", outcome_type = 'poisson')
head(temp_single, n = 5)

