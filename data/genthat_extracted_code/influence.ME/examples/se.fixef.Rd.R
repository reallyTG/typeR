library(influence.ME)


### Name: se.fixef
### Title: Standard errors of fixed estimates
### Aliases: se.fixef
### Keywords: regression

### ** Examples

## Not run: 
##D data(school23)
##D model <- lmer(math ~  homework + structure + (1 | school.ID), data=school23)
##D summary(model)
##D se.fixef(model)
## End(Not run)



