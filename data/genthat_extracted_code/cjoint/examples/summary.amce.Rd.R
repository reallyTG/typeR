library(cjoint)


### Name: summary.amce
### Title: Summarizing AMCE estimates
### Aliases: summary.amce print.summary.amce

### ** Examples


## Not run: 
##D 
##D #Results with respondent-varying characteristics
##D results <-amce(Chosen_Immigrant ~ Gender + Education + Education:ethnocentrism +
##D 	`Country of Origin`+ `Country of Origin`:ethnocentrism + Job +
##D 	Job:ethnocentrism + `Job Experience` + `Job Experience`:ethnocentrism,
##D 	data=immigrationconjoint, design=immigrationdesign,cluster=FALSE,
##D 	respondent.varying="ethnocentrism", na.ignore=TRUE)
##D 
##D #Calculate conditional estimates at user-supplied levels
##D int.vals<-list()
##D int.vals[["ethnocentrism"]]<-c(60,77,88,99,45)
##D summary(results, covariate.values = int.vals)
##D 
## End(Not run)



