library(tidyimpute)


### Name: impute_functions
### Title: Table imputation methods
### Aliases: impute_functions impute_explicit impute_explicit_at
###   impute_explicit_all impute_explicit_if impute_zero impute_zero_at
###   impute_zero_all impute_zero_if impute_inf impute_inf_at
###   impute_inf_all impute_inf_if impute_neginf impute_neginf_at
###   impute_neginf_all impute_neginf_if impute_constant impute_constant_at
###   impute_constant_all impute_constant_if impute_max impute_max_at
###   impute_max_all impute_max_if impute_min impute_min_at impute_min_all
###   impute_min_if impute_median impute_median_at impute_median_all
###   impute_median_if impute_mean impute_mean_at impute_mean_all
###   impute_mean_if impute_most_freq impute_most_freq_at
###   impute_most_freq_all impute_most_freq_if impute_quantile
###   impute_quantile_at impute_quantile_all impute_quantile_if
###   impute_sample impute_sample_at impute_sample_all impute_sample_if
###   impute_random impute_random_at impute_random_all impute_random_if
###   impute_replace impute_replace_at impute_replace_all impute_replace_if

### ** Examples


 ## Not run: 
##D  
##D   nacars %>% impute_zero() 
##D   nacars %>% impute_zero( mpg, cyl )
##D   nacars %>% impute_zero( "mpg", "cyl" )
##D   nacars %>% impute_zero( c("mpg","cyl") )
##D   nacars %>% impute_zero( 1:2 )
##D  
## End(Not run)



