library(dials)


### Name: finalize
### Title: Functions to finalize data-specific parameter ranges
### Aliases: finalize finalize.list finalize.param get_p get_log_p
###   get_n_frac get_n_frac_range get_n get_rbf_range get_batch_sizes

### ** Examples

library(dplyr)
car_pred <- mtcars %>% select(-mpg)

# Needs an upper bound
mtry
finalize(mtry, car_pred)

# Nothing to do here since no unknowns
penalty
finalize(penalty, car_pred)

library(kernlab)
library(tibble)
library(purrr)

params <- 
  tribble(
     ~parameter,   ~object,
         "mtry",      mtry, 
    "num_terms", num_terms, 
    "rbf_sigma", rbf_sigma
  ) 
params
  
# Note that `rbf_sigma` has a default range that does not need to be
# finalized but will be changed if used in the function:
complete_params <- 
  params %>%
  mutate(object = map(object, finalize, car_pred))
complete_params

params %>% dplyr::filter(parameter == "rbf_sigma") %>% pull(object)
complete_params %>% dplyr::filter(parameter == "rbf_sigma") %>% pull(object)




