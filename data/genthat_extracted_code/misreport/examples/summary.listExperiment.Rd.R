library(misreport)


### Name: summary.listExperiment
### Title: Object summary of the listExperiment class
### Aliases: summary.listExperiment

### ** Examples

data(gender)

## Not run: 
##D # Note: substantial computation time
##D model.gender <- listExperiment(y ~ gender + ageGroup + education +
##D                                    motherTongue + region + selfPlacement,
##D                                data = gender, J = 4,
##D                                treatment = "treatment", direct = "direct",
##D                                control.constraint = "none",
##D                                sensitive.response = 0,
##D                                misreport.treatment = TRUE)
##D summary(model.gender)
## End(Not run)




