## ----seed, echo = FALSE--------------------------------------------------
set.seed(100)

## ----twolevelunbal-------------------------------------------------------
library(simglm)
fixed <- ~1 + diff + act + diff:act
random <- ~1 +  diff
fixed_param <- c(4, 6, 2.3, 7)
random_param <- list(random_var = c(7, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("level1", "level2"),
                  opts = list(list(mean = 0, sd = 1.5),
                              list(mean = 0, sd = 4)))
n <- 150
unbal <- TRUE
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "cross"
unbal_design <- list(level2 = list(min = 3, max = 10))
temp_cross <- sim_reg(fixed = fixed, random = random, 
                      fixed_param = fixed_param, 
                      random_param = random_param, cov_param = cov_param,
                      k = NULL, n = n, p = NULL, error_var = error_var,
                      with_err_gen = with_err_gen, data_str = data_str, 
                      unbal = list(level2 = TRUE), unbal_design = unbal_design)

## ----clustValue----------------------------------------------------------
table(temp_cross$clustID)

## ----bal3lvl2------------------------------------------------------------
fixed <- ~1 + time + diff + act + actClust + time:act
random <- ~1 + time + diff
random3 <- ~ 1 + time
fixed_param <- c(4, 2, 6, 2.3, 7, 0)
random_param <- list(random_var = c(7, 4, 2), rand_gen = "rnorm")
random_param3 <- list(random_var = c(4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm', 'rnorm'),
                  var_type = c("level1", "level2", "level3"),
                  opts = list(list(mean = 0, sd = 1.5),
                              list(mean = 0, sd = 4),
                              list(mean = 0, sd = 2)))
k <- 10
n <- 150
unbal <- list(level2 = TRUE, level3 = FALSE)
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
unbal_design <- list(level2 = list(min = 3, max = 10), level3 = NULL)
temp_three <- sim_reg(fixed = fixed, random = random, random3 = random3,
      fixed_param = fixed_param, random_param = random_param, 
      random_param3 = random_param3, cov_param = cov_param, k = k,
      n = n, p = p, unbal = unbal, error_var = error_var,
      with_err_gen = with_err_gen, 
      data_str = data_str, unbal_design = unbal_design)

## ----threecheck----------------------------------------------------------
table(temp_three$clustID)
func_temp <- function(x) length(unique(x))
tapply(temp_three$clustID, temp_three$clust3ID, func_temp)

## ----unbal3lvl2----------------------------------------------------------
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
unbal <- list(level2 = TRUE, level3 = TRUE)
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
unbal_design <- list(level2 = list(min = 3, max = 15), 
                     level3 = list(min = 3, max = 10))
temp_three <- sim_reg(fixed = fixed, random = random, random3 = random3,
      fixed_param = fixed_param, random_param = random_param, 
      random_param3 = random_param3, cov_param = cov_param, k = k,
      n = NULL, p = NULL, unbal = unbal, error_var = error_var,
      with_err_gen = with_err_gen, 
      data_str = data_str, unbal_design = unbal_design)

## ----unbal3--------------------------------------------------------------
table(temp_three$clustID)
tapply(temp_three$clustID, temp_three$clust3ID, func_temp)

## ----unbal_direct--------------------------------------------------------
fixed <- ~1 + diff + act + diff:act
random <- ~1 +  diff
fixed_param <- c(4, 6, 2.3, 7)
random_param <- list(random_var = c(7, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = c('rnorm', 'rnorm'),
                  var_type = c("level1", "level2"),
                  opts = list(list(mean = 0, sd = 1.5),
                              list(mean = 0, sd = 4)))
n <- 6
unbal <- TRUE
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "cross"
unbal_design <- list(level2 = c(6, 3, 5, 2, 10, 7))
temp_cross <- sim_reg(fixed = fixed, random = random, 
                      fixed_param = fixed_param, 
                      random_param = random_param, cov_param = cov_param,
                      k = NULL, n = n, p = NULL, error_var = error_var,
                      with_err_gen = with_err_gen, data_str = data_str, 
                      unbal = list(level2 = TRUE), unbal_design = unbal_design)

## ----direct_table--------------------------------------------------------
table(temp_cross$clustID)

## ----twolevelunbal_factor------------------------------------------------
fixed <- ~1 + diff + act.o + diff:act.o
random <- ~1 +  diff
fixed_param <- c(4, 6, 2.3, 7)
random_param <- list(random_var = c(7, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = 'rnorm', 
                  var_type = c("level1"),
                  opts = list(list(mean = 0, sd = 1.5)))
fact_vars <- list(numlevels = c(36), var_type = c('level2'),
                  opts = list(list(replace = TRUE)))
n <- 150
unbal <- TRUE
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "cross"
unbal_design <- list(level2 = list(min = 3, max = 10))
temp_cross <- sim_reg(fixed = fixed, random = random, 
                      fixed_param = fixed_param, 
                      random_param = random_param, cov_param = cov_param,
                      k = NULL, n = n, p = NULL, error_var = error_var,
                      with_err_gen = with_err_gen, data_str = data_str, 
                      unbal = list(level2 = TRUE), unbal_design = unbal_design, 
                      fact_vars = fact_vars)

## ----unbal3lvl2_factor---------------------------------------------------
fixed <- ~1 + time + diff + act.o + num_rooms.o + time:act.o
random <- ~1 + time + diff
random3 <- ~ 1 + time
fixed_param <- c(4, 2, 6, 2.3, 7, 0)
random_param <- list(random_var = c(7, 4, 2), rand_gen = 'rnorm')
random_param3 <- list(random_var = c(4, 2), rand_gen = 'rnorm')
cov_param <- list(dist_fun = 'rnorm', 
                  var_type = c("level1"),
                  opts = list(list(mean = 0, sd = 1.5)))
fact_vars <- list(numlevels = c(36, 12), var_type = c('level2', 'level3'),
                  opts = list(list(replace = TRUE), list(replace = TRUE)))
k <- 10
unbal <- list(level2 = TRUE, level3 = TRUE)
error_var <- 4
with_err_gen <- 'rnorm'
data_str <- "long"
unbal_design <- list(level2 = list(min = 3, max = 8),
                     level3 = list(min = 3, max = 6))
temp_three <- sim_reg(fixed = fixed, random = random, random3 = random3,
      fixed_param = fixed_param, random_param = random_param, 
      random_param3 = random_param3, cov_param = cov_param, k = k,
      n = NULL, p = NULL, unbal = unbal, error_var = error_var,
      with_err_gen = with_err_gen, 
      data_str = data_str, unbal_design = unbal_design,
      fact_vars = fact_vars)

