library(influence.ME)


### Name: grouping.levels
### Title: Returns the levels of a grouping factor in a mixed effects
###   regression model
### Aliases: grouping.levels
### Keywords: models regression

### ** Examples

 ## Not run: 
##D  # Penicillin data originates from the lme4 package.
##D  model <- lmer(diameter ~ (1|plate) + (1|sample), Penicillin)
##D 
##D  grouping.levels(model, "plate")
##D  grouping.levels(model, "sample")
## End(Not run)



