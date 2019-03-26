library(cjoint)


### Name: amce
### Title: Estimating Causal Effects in Conjoint Experiments
### Aliases: amce

### ** Examples

## Not run: 
##D # Immigration Choice Conjoint Experiment Data from Hainmueller et. al. (2014).
##D data("immigrationconjoint")
##D data("immigrationdesign")
##D 
##D # Run AMCE estimator using all attributes in the design
##D results <- amce(Chosen_Immigrant ~  Gender + Education + `Language Skills` +
##D                 `Country of Origin` + Job + `Job Experience` + `Job Plans` +
##D                 `Reason for Application` + `Prior Entry`, data=immigrationconjoint,
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign)
##D # Print summary
##D summary(results)
##D 
##D 
##D # Run AMCE estimator using all attributes in the design with interactions
##D interaction_results <- amce(Chosen_Immigrant ~  Gender + Education + `Language Skills` +
##D                 `Country of Origin` + Job + `Job Experience` + `Job Plans` +
##D                 `Reason for Application` + `Prior Entry` + Education:`Language Skills` +
##D 		Job: `Job Experience` + `Job Plans`:`Reason for Application`,
##D 		data=immigrationconjoint, cluster=TRUE, respondent.id="CaseID",
##D 		design=immigrationdesign)
##D # Print summary
##D summary(interaction_results)
##D 
##D # create weights in data
##D weights <- runif(nrow(immigrationconjoint))
##D immigrationconjoint$weights <- weights
##D # Run AMCE estimator using weights
##D results <- amce(Chosen_Immigrant ~  Gender + Education + `Language Skills` +
##D                 `Country of Origin` + Job + `Job Experience` + `Job Plans` +
##D                 `Reason for Application` + `Prior Entry`, data=immigrationconjoint,
##D                 cluster=TRUE, respondent.id="CaseID", design=immigrationdesign,
##D 		weights = "weights")
##D # Print summary
##D summary(results)
##D 
##D # Include a respondent-varying interaction
##D results <- amce(Chosen_Immigrant ~ Gender + Education + Job +
##D 	   	ethnocentrism:Job + Education:Job,
##D 		data=immigrationconjoint, na.ignore = TRUE,
##D 		cluster=FALSE,design=immigrationdesign,
##D 		respondent.varying = "ethnocentrism")
##D # Print summary
##D summary(results)
##D 
##D # Change the baseline for "Education"
##D baselines <- list()
##D baselines$Education <- "graduate degree"
##D 
##D results <- amce(Chosen_Immigrant ~ Gender + Education + Job +
##D 		 Education:Job, data=immigrationconjoint,
##D 		 cluster=FALSE,design=immigrationdesign,
##D 		 baselines=baselines)
##D # Print summary
##D summary(results)
## End(Not run)




