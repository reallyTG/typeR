library(influence.ME)


### Name: dfbetas.estex
### Title: Compute the DFBETAS measure of influential data
### Aliases: dfbetas.estex dfbetas
### Keywords: robust models regression

### ** Examples

## Not run: 
##D  data(school23)
##D  model <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D 
##D  alt.est <- influence(model, group="school.ID")
##D  dfbetas(alt.est)
## End(Not run)



