library(customsteps)


### Name: step_custom_transformation
### Title: Custom Transformation
### Aliases: step_custom_transformation tidy.step_custom_transformation
### Keywords: datagen

### ** Examples

library(dplyr)
library(purrr)
library(tibble)
library(recipes)
library(generics)

# divide 'mtcars' into two data sets.
cars_initial <- mtcars[1:16, ]
cars_new <- mtcars[17:nrow(mtcars), ]

# define prep helper function, that computes means and standard deviations
# for (an arbitrary number of) numeric variables.
compute_means_sd <- function(x) {
 
 map(.x = x, ~ list(mean = mean(.x), sd = sd(.x)))
 
}

# define bake helper function, that centers numeric variables to have
# a mean of 'alpha' and scale them to have a standard deviation of
# 'beta'.
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

# create recipe.
rec <- recipe(cars_initial) %>%
  step_custom_transformation(mpg, disp,
                             prep_function = compute_means_sd,
                             bake_function = center_scale,
                             bake_options = list(alpha = 0, beta = 1),
                             bake_how = "replace")

# prep recipe.
rec_prep <- prep(rec)

# bake recipe.
rec_baked <- bake(rec_prep, cars_new)
rec_baked

# inspect output.
rec
rec_baked
tidy(rec)
tidy(rec, 1)
tidy(rec_prep)
tidy(rec_prep, 1)



