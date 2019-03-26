library(influence.ME)


### Name: sigtest
### Title: Test for changes in the level of statistical significance
###   resulting from the deletion of potentially influential observations
### Aliases: sigtest
### Keywords: influence

### ** Examples

## Not run: 
##D data(school23)
##D m23 <- lmer(math ~ homework + structure 
##D    + (1 | school.ID), 
##D    data=school23)
##D 
##D estex.m23  <- influence(m23, group="school.ID")
##D    
##D sigtest(estex.m23, test=-1.96)$structure
## End(Not run)



