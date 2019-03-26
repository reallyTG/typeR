library(healthcareai)


### Name: flash_models
### Title: Train models without tuning for performance
### Aliases: flash_models

### ** Examples

## Not run: 
##D # Prepare data
##D prepped_data <- prep_data(pima_diabetes, patient_id, outcome = diabetes)
##D 
##D # Get models quickly at default hyperparameter values
##D flash_models(prepped_data)
##D 
##D # Speed comparison of no tuning with flash_models vs. tuning with tune_models:
##D # ~15 seconds:
##D system.time(
##D   tune_models(prepped_data, diabetes)
##D )
##D # ~3 seconds:
##D system.time(
##D   flash_models(prepped_data, diabetes)
##D )
## End(Not run)



