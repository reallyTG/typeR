library(healthcareai)


### Name: save_models
### Title: Save models to disk and load models from disk
### Aliases: save_models load_models

### ** Examples

## Not run: 
##D m <- machine_learn(pima_diabetes, patient_id, outcome = diabetes)
##D save_models(m, "diabetes_models.RDS")
##D # Restart R, move RDS file to another computer, etc.
##D m2 <- load_models("diabetes_models.RDS")
##D all.equal(m, m2)
## End(Not run)



