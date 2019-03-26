## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(simglm)
knit_print.data.frame = function(x, ...) {
  res = paste(c('', '', kable(x, output = FALSE)), collapse = '\n')
  asis_output(res)
}

## ----install, eval=FALSE-------------------------------------------------
#  library(devtools)
#  install_github("lebebr01/simglm", build_vignettes = TRUE)
#  library(simglm)

## ----singlelevel---------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(2, 4, 1, 3.5, 2)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'), 
                  var_type = c("single", "single", "single"),
                  opts = list(list(mean = 0, sd = 4),
                              list(mean = 0, sd = 3),
                              list(mean = 0, sd = 3)))
n <- 150
error_var <- 3
with_err_gen = 'rnorm'
temp_single <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                       cov_param = cov_param,
                       n = n, error_var = error_var, 
                       with_err_gen = with_err_gen, 
                       data_str = "single")

## ----printsinglelevel----------------------------------------------------
head(temp_single)

## ----simpregmod----------------------------------------------------------
summary(lm(sim_data ~ 1 + act + diff + numCourse + act:numCourse, data = temp_single))

## ----singlelevelfact-----------------------------------------------------
fixed <- ~ 1 + act_o + diff.o + numCourse_f + act_o:numCourse_f
fixed_param <- c(0.8, 1, 0.2, 0.1, 0, 0.15, 0.2, 0.5, 0.02, -0.6, -0.1)
cov_param <- NULL
fact_vars <- list(numlevels = c(36, 8, 5), 
                  var_type = c('single', 'single', "single"),
                  opts = list(list(replace = TRUE), list(replace = TRUE),
                              list(replace = TRUE)))
n <- 150
error_var <- 3
with_err_gen = 'rnorm'
temp_single_o <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, n = n, error_var = error_var,
                         with_err_gen = with_err_gen, data_str = "single", 
                         fact_vars = fact_vars)

## ----printsinglelevelfact------------------------------------------------
head(temp_single_o)

## ----corvars-------------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse_o + act:numCourse_o
fixed_param <- c(2, 4, 1, 3.5, 2)
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("single", "single"),
                  opts = list(list(mean = 0, sd = 4),
                              list(mean = 0, sd = 3)))
fact_vars <- list(numlevels = 5, var_type = "single", 
                  opts = list(list(replace = TRUE)))
n <- 150
error_var <- 3
with_err_gen = 'rnorm'
cor_vars <- 0.6
temp_single_o <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, n = n, 
                         error_var = error_var,
                         with_err_gen = with_err_gen, data_str = "single", 
                         cor_vars = cor_vars, fact_vars = fact_vars)
cor(temp_single_o[, 2:3])

## ----other_dists---------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse_o + act:numCourse_o
fixed_param <- c(2, 4, 1, 3.5, 2)
cov_param <- list(dist_fun = c('rt', 'rgamma'),
                  var_type = c("single", "single"),
                  opts = list(list(df = 5),
                              list(shape = 2)))
fact_vars <- list(numlevels = 5, var_type = "single",
                  opts = list(list(replace = TRUE)))
n <- 150
error_var <- 3
with_err_gen = 'rnorm'
cor_vars <- 0.6
temp_single_o <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, n = n, 
                         error_var = error_var,
                         with_err_gen = with_err_gen, data_str = "single", 
                         cor_vars = cor_vars, fact_vars = fact_vars)
cor(temp_single_o[, 2:3])

## ----heterogeneity-------------------------------------------------------
fixed <- ~ 1 + act + diff + numCourse + act:numCourse
fixed_param <- c(2, 4, 1, 3.5, 2)
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'), 
                  var_type = c("single", "single", "single"),
                  cov_param = list(list(mean = 0, sd = 4),
                                   list(mean = 0, sd = 3),
                                   list(mean = 0, sd = 3)))
n <- 1500
error_var <- c(3, 50, 10)
with_err_gen = 'rnorm'

temp_single <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                       cov_param = cov_param,
                       n = n, error_var = error_var, 
                       with_err_gen = with_err_gen, 
                       data_str = "single", 
                       homogeneity = FALSE, heterogeneity_var = 'diff')

## ----heterogeneity_figure------------------------------------------------
library(ggplot2)
ggplot(temp_single, aes(x = diff, y = err)) + 
  geom_point(size = 3) + theme_bw()

## ----hetero_groups-------------------------------------------------------
fixed <- ~ 1 + act_o + diff.o + numCourse_f
fixed_param <- c(0.8, 1, 0.2, 0.1, 0, 0.15, 0.2)
cov_param <- NULL
fact_vars <- list(numlevels = c(36, 8, 5), 
                  var_type = c('single', 'single', "single"),
                  opts = list(list(replace = TRUE), list(replace = TRUE),
                              list(replace = TRUE)))
n <- 150
error_var <- c(3, 10, 20, 5, 4)
with_err_gen = 'rnorm'
temp_single_o <- sim_reg(fixed = fixed, fixed_param = fixed_param, 
                         cov_param = cov_param, n = n, error_var = error_var,
                         with_err_gen = with_err_gen, data_str = "single", 
                         fact_vars = fact_vars, 
                         homogeneity = FALSE, heterogeneity_var = 'numCourse_f')

## ----hetero_groups_fig---------------------------------------------------
ggplot(temp_single_o, aes(x = factor(numCourse_f), y = err)) + 
  geom_boxplot() + theme_bw()

## ----longsim-------------------------------------------------------------
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
data_str <- "long"
temp_long <- sim_reg(fixed = fixed, random = random, 
                     fixed_param = fixed_param, 
                     random_param = random_param, cov_param = cov_param, 
                     k = NULL, n = n, p = p,
                     error_var = error_var, with_err_gen = "rnorm",
                     data_str = data_str, unbal = list(level2 = FALSE))

## ----longdata------------------------------------------------------------
head(temp_long)

## ----lme4----------------------------------------------------------------
library(lme4)
lmer(sim_data ~ 1 + time + diff + act + time:act + (1 + time + diff | clustID),
     data = temp_long)

## ----long_time-----------------------------------------------------------
fixed <- ~1 + time + diff + act + time:act
random <- ~1 + time + diff
fixed_param <- c(4, 2, 6, 2.3, 7)
random_param <- list(random_var = c(7, 4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm'), 
                  var_type = c("level1", "level2"), 
                  time_var = c(0, 0.5, 1, 3, 5),
                  opts = list(list(mean = 0, sd = 1.5), 
                              list(mean = 0, sd = 4)))
n <- 150
p <- 5
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
temp_long <- sim_reg(fixed, random, random3 = NULL, fixed_param, 
                     random_param, random_param3 = NULL,
                     cov_param, k = NULL, n, p, error_var, with_err_gen, 
                     data_str = data_str)
head(temp_long)

