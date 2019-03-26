library(EdSurvey)


### Name: achievementLevels
### Title: Achievement Levels
### Aliases: achievementLevels

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))
##D 
##D # Discrete achievement levels
##D achievementLevels(achievementVars=c("composite"), aggregateBy=NULL, data=sdf)
##D 
##D # Discrete achievement levels with a different subscale
##D achievementLevels(achievementVars=c("num_oper"), aggregateBy=NULL, data=sdf)
##D 
##D # Cumulative achievement levels
##D achievementLevels(achievementVars=c("composite"), aggregateBy=NULL, data=sdf, 
##D                   returnCumulative=TRUE) 
##D 
##D # Cumulative achievement levels with a different subscale
##D achievementLevels(achievementVars=c("num_oper"), aggregateBy=NULL, data=sdf, 
##D                   returnCumulative=TRUE) 
##D 
##D # Achievement levels as independent variables, by sex aggregated by composite
##D achievementLevels(achievementVars=c("composite", "dsex"), aggregateBy="composite",
##D                   data=sdf, returnCumulative=TRUE) 
##D 
##D # Achievement levels as independent variables, by sex aggregated by sex
##D achievementLevels(achievementVars=c("composite", "dsex"), aggregateBy="dsex", 
##D                   data=sdf, returnCumulative=TRUE) 
##D 
##D # Achievement levels as independent variables, by race aggregated by race
##D achievementLevels(achievementVars=c("composite", "sdracem"),
##D                   aggregateBy="sdracem", data=sdf, returnCumulative=TRUE) 
##D 
##D # Use customized cutpoints
##D achievementLevels(achievementVars=c("composite"), aggregateBy=NULL, data=sdf, 
##D                   cutpoints = c("Customized Basic" = 200, 
##D                                 "Customized Proficient" = 300, 
##D                                 "Customized Advanced" = 400))
##D 
##D # Use recode to change values for specified variables:
##D achievementLevels(achievementVars=c("composite", "dsex", "b017451"),
##D                   aggregateBy = "dsex", sdf,
##D                   recode=list(b017451=list(from=c("Never or hardly ever",
##D                                                   "Once every few weeks",
##D                                                   "About once a week"),
##D                                            to="Infrequently"),
##D                               b017451=list(from=c("2 or 3 times a week",
##D                                                   "Every day"),
##D                                            to="Frequently")))
##D 
## End(Not run)



