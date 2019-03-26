library(influence.ME)


### Name: pchange
### Title: Compute the percentage change, as measure of influential data
### Aliases: pchange
### Keywords: robust models regression

### ** Examples

## Not run: 
##D  data(school23)
##D  model <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D 
##D  alt.est <- influence(model, group="school.ID")
##D  pchange(alt.est)
## End(Not run)



