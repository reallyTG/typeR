library(cjoint)


### Name: immigrationconjoint
### Title: Immigration Conjoint Experiment Dataset from Hainmueller et. al.
###   (2014)
### Aliases: immigrationconjoint
### Keywords: datasets

### ** Examples

## Not run: 
##D data("immigrationconjoint")
##D data("immigrationdesign")
##D 
##D # Run AMCE estimator using all attributes in the design
##D results <- amce(Chosen_Immigrant ~  Gender + Education + `Language Skills` + 
##D                 `Country of Origin` + Job + `Job Experience` + `Job Plans` + 
##D                 `Reason for Application` + `Prior Entry`, data=immigrationconjoint, 
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign)
## End(Not run)



