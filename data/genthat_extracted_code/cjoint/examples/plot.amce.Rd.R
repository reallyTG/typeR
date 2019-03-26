library(cjoint)


### Name: plot.amce
### Title: Plot AMCE Estimates
### Aliases: plot.amce

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
##D 
##D # Plot results
##D plot(results, xlab="Change in Pr(Immigrant Preferred for Admission to U.S.)",
##D     ylim=c(-.3,.3), breaks=c(-.2, 0, .2), labels=c("-.2","0",".2"), text.size=13)
##D 	
##D # Plot results with user-specified order of attributes
##D plot(results, xlab="Change in Pr(Immigrant Preferred for Admission to U.S.)",
##D      ylim=c(-.3,.3), breaks=c(-.2, 0, .2), labels=c("-.2","0",".2"), text.size=13,
##D      group.order=c("Gender","Education","Job",
##D                      "Language Skills","Job Experience",
##D                      "Job Plans","Reason for Application",
##D                      "Prior Entry","Country of Origin"))
##D 
##D 
##D # Run AMCE estimator with an interaction with a respondent-varying characteristic
##D interaction_results <- amce(Chosen_Immigrant ~ Gender + Education
##D 		    + Job + ethnocentrism:Job,
##D 		    data = immigrationconjoint,na.ignore=TRUE,
##D 		    design = immigrationdesign, cluster = FALSE,
##D 		    respondent.varying = "ethnocentrism")
##D 
##D # Plot results with additional plots for quantiles of the respondent-varying characteristic
##D plot(interaction_results)
##D 
##D # Plot results with user-specified order of attributes
##D plot(interaction_results, group.order=c("Gender","Education","Job"))
##D 
##D # Do not show output for variables that do not vary with facetted levels
##D plot(interaction_results,plot.display="unconditional")
##D 
##D # RUN AMCE estimator with an interaction between two factor variables
##D interaction_results <- amce(Chosen_Immigrant ~ Gender + Education + Job
##D 		    + Education:Job, data = immigrationconjoint,
##D 		    cluster = FALSE, design = immigrationdesign)
##D 
##D # Plot results with different plots for all levels of ACIE
##D plot(interaction_results,facet.names = "Education")
##D 
##D 
##D # Plot results with different plots for only two levels of one interacted variable
##D facet.levels1 <- list()
##D facet.levels1[["Education"]] <- c("college degree","graduate degree")
##D plot(interaction_results,facet.names = "Education",facet.levels = facet.levels1)
##D 
##D # Display only interaction panes
##D plot(interaction_results,facet.names = "Education",plot.display="interaction")
##D 
##D #Display only non-interaction panes
##D plot(interaction_results,facet.names = "Education",plot.display="unconditional")
##D 
##D #Change displayed attribute and level names
##D results <- amce(Chosen_Immigrant ~ Gender + Education + Job, data = immigrationconjoint,
##D 		    cluster = FALSE, design = immigrationdesign)
##D levels.test<-list()
##D levels.test[["Gender"]]<-c("level1","level2")
##D levels.test[["Education"]]<-c("level1","b","c","d","e","f","g")
##D levels.test[["Job"]]<-c("a","b","c","d","e","f","g","h","i","j","k")
##D plot(results, level.names = levels.test, main="test", xlab="test", 
##D ci=0.95, breaks=c(-0.2,-0.1,0,0.1,0.2), attribute.names = c("attribute1","attribute2","attribute3"))
##D 
## End(Not run)



