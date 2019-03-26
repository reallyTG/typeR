library(influence.ME)


### Name: cooks.distance.estex
### Title: Compute the Cook's distance measure of influential data on mixed
###   effects models
### Aliases: cooks.distance.estex cooks.distance
### Keywords: robust models regression

### ** Examples

## Not run: 
##D data(school23)
##D model <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D 
##D alt.est <- influence(model, group="school.ID")
##D cooks.distance(alt.est)
## End(Not run)



