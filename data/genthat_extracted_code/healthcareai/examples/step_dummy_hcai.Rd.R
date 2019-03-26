library(healthcareai)


### Name: step_dummy_hcai
### Title: Dummy Variables Creation
### Aliases: step_dummy_hcai tidy.step_dummy_hcai
### Keywords: datagen

### ** Examples

rec <- recipes::recipe(head(pima_diabetes), ~.) %>%
  healthcareai:::step_dummy_hcai(weight_class)
d <- recipes::prep(rec, training = pima_diabetes)
d <- recipes::bake(d, new_data = pima_diabetes)

# Specify ref_levels
ref_levels <- list(weight_class = "normal")
rec <- recipes::recipe(head(pima_diabetes), ~.)
rec <- rec %>% healthcareai:::step_dummy_hcai(weight_class,
                                              levels = ref_levels)




