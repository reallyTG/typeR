library(cjoint)


### Name: immigrationdesign
### Title: Conjoint Design for the Immigration Experiment in Hainmueller
###   et. al. (2014)
### Aliases: immigrationdesign
### Keywords: datasets

### ** Examples

## Not run: 
##D # Loads the immigrationconjoint dataset and the immigrationdesign object
##D data("immigrationconjoint")
##D data("immigrationdesign")
##D 
##D # immigrationdesign is passed to the amce() function through the "design" argument.
##D results <- amce(Chosen_Immigrant ~  Gender + Education + `Language Skills` + 
##D                 `Country of Origin` + Job + `Job Experience` + `Job Plans` + 
##D                 `Reason for Application` + `Prior Entry`, data=immigrationconjoint, 
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign)
##D 
## End(Not run)



