## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(dplyr)
library(simglm)
knit_print.data.frame = function(x, ...) {
  res = paste(c('', '', kable(x, output = FALSE)), collapse = '\n')
  asis_output(res)
}

## ----simulate_fixed------------------------------------------------------
library(simglm)

set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + x1 + x2,
  fixed = list(x1 = list(var_type = 'continuous', mean = 180, sd = 30),
               x2 = list(var_type = 'continuous', mean = 40, sd = 5)),
  sample_size = 10
)

simulate_fixed(data = NULL, sim_arguments)

## ----simulate_fixed_real-------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'continuous', mean = 40, sd = 5)),
  sample_size = 10
)

simulate_fixed(data = NULL, sim_arguments)

## ----simulate_fixed_ordinal----------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60)),
  sample_size = 10
)

simulate_fixed(data = NULL, sim_arguments)

## ----simulate_fixed_factor-----------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  sample_size = 10
)

simulate_fixed(data = NULL, sim_arguments)

## ----simulate_error------------------------------------------------------
set.seed(321)

sim_arguments <- list(
  sample_size = 10
)

simulate_error(data = NULL, sim_arguments)

## ----simulate_error_verbose----------------------------------------------
set.seed(321)

sim_arguments <- list(
  error = list(variance = 1),
  sample_size = 10
)

simulate_error(data = NULL, sim_arguments)

## ----simulate_error_var25------------------------------------------------
set.seed(321)

sim_arguments <- list(
  error = list(variance = 25),
  sample_size = 10
)

simulate_error(data = NULL, sim_arguments)

## ----generate_response---------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5)
)

simulate_fixed(data = NULL, sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments)

## ----binary--------------------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5),
  outcome_type = 'binary'
)

simulate_fixed(data = NULL, sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments)

## ----count---------------------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 0, sd = 30),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.01, 0.5),
  outcome_type = 'count'
)

simulate_fixed(data = NULL, sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments)

## ----model_extract_coefficients------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5)
)

simulate_fixed(data = NULL, sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments) %>% 
  model_fit(sim_arguments) %>%
  extract_coefficients()

## ----model_fit_manual----------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5),
  model_fit = list(formula = y ~ 1 + age + sex,
                   model_function = 'lm',
                   reg_weights = c(2, -0.1, 0.5))
)

simulate_fixed(data = NULL, sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments) %>% 
  model_fit(sim_arguments) %>%
  extract_coefficients()

## ----replicate_simulation------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5),
  model_fit = list(formula = y ~ 1 + age + sex,
                   model_function = 'lm',
                   reg_weights = c(2, -0.1, 0.5)),
  replications = 10
)

replicate_simulation(sim_arguments, 
                     simulate_fixed(data = NULL, sim_arguments) %>%
                       simulate_error(sim_arguments) %>%
                       generate_response(sim_arguments) %>% 
                       model_fit(sim_arguments) %>%
                       extract_coefficients()) %>%
  compute_statistics(sim_arguments)

## ----replicate_simulation_power_values-----------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex,
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  error = list(variance = 25),
  sample_size = 10,
  reg_weights = c(2, 0.3, -0.1, 0.5),
  model_fit = list(formula = y ~ 1 + age + sex,
                   model_function = 'lm',
                   reg_weights = c(2, -0.1, 0.5)),
  replications = 10,
  power = list(
    dist = 'qt',
    alpha = .02,
    opts = list(df = 1)
  )
)

replicate_simulation(sim_arguments, 
                     simulate_fixed(data = NULL, sim_arguments) %>%
                       simulate_error(sim_arguments) %>%
                       generate_response(sim_arguments) %>% 
                       model_fit(sim_arguments) %>%
                       extract_coefficients()) %>%
  compute_statistics(sim_arguments)

## ----nested--------------------------------------------------------------
set.seed(321) 

sim_arguments <- list(
  formula = y ~ 1 + weight + age + sex + (1 | neighborhood),
  reg_weights = c(4, -0.03, 0.2, 0.33),
  fixed = list(weight = list(var_type = 'continuous', mean = 180, sd = 30),
               age = list(var_type = 'ordinal', levels = 30:60),
               sex = list(var_type = 'factor', levels = c('male', 'female'))),
  randomeffect = list(int_neighborhood = list(variance = 8, var_level = 2)),
  sample_size = list(level1 = 10, level2 = 20)
)

nested_data <- sim_arguments %>%
  simulate_fixed(data = NULL, .) %>%
  simulate_randomeffect(sim_arguments) %>%
  simulate_error(sim_arguments) %>%
  generate_response(sim_arguments)

head(nested_data, n = 10)
nrow(nested_data)

