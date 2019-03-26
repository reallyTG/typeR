library(futureheatwaves)


### Name: apply_all_models
### Title: Apply a function across heat waves from all projections
### Aliases: apply_all_models

### ** Examples

ex_results <- system.file("extdata/example_results",
                          package = "futureheatwaves")
apply_all_models(ex_results, FUN = average_mean_temp)
apply_all_models(ex_results, FUN = average_mean_temp,
                 city_specific = TRUE)




