library(customsteps)


### Name: step_custom_filter
### Title: Custom Filter
### Aliases: step_custom_filter tidy.step_custom_filter
### Keywords: datagen

### ** Examples

library(magrittr)
library(tidyselect)
library(generics)
library(tibble)
library(purrr)
library(recipes)

# generate data.
df <- tibble(a = c(1, -999, 3,NA,NA),
             b = c(1,3, NA,NA,NA),
             c = c(1,-999,3,4,5),
             d = rep(1, 5),
             e = c(-999, -999, -999, -999, NA),
             f = rep(NA, 5))

# Create custom filter function to identify variables with a proportion of
# missing values above some threshold. The function treats # values provided
# with the 'other_values' argument as missings.

filter_missings <- function(x, threshold = 0.5, other_values = NULL) {

  # identify problematic variables.
  if (is.null(other_values)) {

    problematic_lgl <- map_lgl(x, ~ mean(is.na(.)) >= threshold)

  } else {

    problematic_lgl <- map_lgl(x, ~ mean(is.na(.) | 
    . %in% other_values) >= threshold)

  }

  # return names of problematic variables.
  names(x)[problematic_lgl]

}

# create recipe.
rec <- recipe(df) %>%
  step_custom_filter(everything(),
                     filter_function = filter_missings,
                     options = list(threshold = 0.5, other_values = -999))

# prep recipe.
rec_prep <- prep(rec)

# bake recipe.
rec_baked <- bake(rec_prep, df)

# inspect output.
tidy(rec)
tidy(rec, number = 1)
tidy(rec_prep)
tidy(rec_prep, number = 1)
rec_baked




