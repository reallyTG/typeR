## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ---- message = FALSE, warning = FALSE-----------------------------------
# install.packages("customsteps")
library(customsteps)

## ---- message = FALSE, warning = FALSE-----------------------------------
library(purrr)

compute_means_sd <- function(x) {
  
  map(.x = x, ~ list(mean = mean(.x), sd = sd(.x)))

}

## ---- message = FALSE, warning = FALSE-----------------------------------
library(dplyr)

# divide 'mtcars' into two data sets.
cars_initial <- mtcars[1:16, ]
cars_new <- mtcars[17:nrow(mtcars), ]

# learn parameters from initial data set.
params <- cars_initial %>%
  select(mpg, disp) %>%
  compute_means_sd(.)

# display parameters. 
as.data.frame(params)

## ---- message = FALSE, warning = FALSE-----------------------------------
center_scale <- function(x, prep_output, alpha, beta) {

  # extract only the relevant variables from the new data set.
  new_data <- select(x, names(prep_output))

  # apply transformation to each of these variables.
  # variables are centered around 'alpha' and scaled to have a standard 
  # deviation of 'beta'.
  map2(.x = new_data,
       .y = prep_output,
       ~ alpha + (.x - .y$mean) * beta / .y$sd)
  
}

## ---- message = FALSE, warning = FALSE-----------------------------------
library(tibble)
# center and scale variables of new data set to have a mean of zero
# and a standard deviation of one.
cars_initial_transformed <- center_scale(x = cars_initial, 
                                         prep_output = params,
                                         alpha = 0, 
                                         beta = 1)

# display transformed variables.
cars_initial_transformed %>%
  compute_means_sd(.) %>%
  as.data.frame(.)

## ---- message = FALSE, warning = FALSE-----------------------------------
# center and scale variables of new data set to have a mean of zero
# and a standard deviation of one.
cars_new_transformed <- center_scale(x = cars_new, 
                                     prep_output = params,
                                     alpha = 0, 
                                     beta = 1)

# display transformed variables.
cars_new_transformed %>%
  as.tibble(.) %>%
  head(.)

## ---- message = FALSE, warning = FALSE-----------------------------------
library(recipes)
rec <- recipe(cars_initial) %>%
  step_custom_transformation(mpg, disp,
                             prep_function = compute_means_sd,
                             bake_function = center_scale,
                             bake_options = list(alpha = 0, beta = 1),
                             bake_how = "replace")

## ---- message = FALSE, warning = FALSE-----------------------------------
# prep recipe.
rec <- prep(rec)

# print recipe.
rec

## ---- message = FALSE, warning = FALSE-----------------------------------
# bake recipe.
cars_baked <- rec %>%
  bake(cars_new) %>%
  select(mpg, disp)
  
# display results.
cars_baked %>%
  head(.)

