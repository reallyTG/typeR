library(influence.ME)


### Name: influence.ME-package
### Title: Influence.ME: Tools for detecting influential data in mixed
###   effects models
### Aliases: influence.ME-package influence.ME
### Keywords: package robust models regression

### ** Examples

## Not run: 
##D data(school23)
##D 
##D model.a <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D alt.est.a <- influence(model.a, "school.ID")
##D  
##D model.b <- exclude.influence(model.a, "school.ID", "7472")
##D alt.est.b <- influence(model.b, "school.ID")
##D 
##D cooks.distance(alt.est.b)
##D 
##D model.c <- exclude.influence(model.b, "school.ID", "54344")
##D alt.est.c <- influence(model.c, "school.ID")
##D 
##D cooks.distance(alt.est.c)
## End(Not run)



