library(misreport)


### Name: predict.listExperiment
### Title: Predict method for the list experiment
### Aliases: predict.listExperiment

### ** Examples


data(gender)

## Not run: 
##D # Note: substantial computation time
##D model.gender <- listExperiment(y ~ gender + ageGroup + education +
##D                                        motherTongue + region + selfPlacement,
##D                                    data = gender, J = 4,
##D                                    treatment = "treatment", direct = "direct",
##D                                    control.constraint = "none",
##D                                    sensitive.response = 0,
##D                                    misreport.treatment = TRUE)
##D predict(model.gender, treatment.misreport = 0)
## End(Not run)




