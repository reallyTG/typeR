library(influence.ME)


### Name: exclude.influence
### Title: Exclude the influence of a grouped set of observations in mixed
###   effects models.
### Aliases: exclude.influence
### Keywords: robust models regression

### ** Examples

 ## Not run: 
##D  data(school23)
##D  model.a <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D  summary(model.a)
##D  model.b <- exclude.influence(model.a, grouping="school.ID", level="7472")
##D  summary(model.b)
##D  model.c <- exclude.influence(model.a, grouping="school.ID", level=c("7472", "62821"))
##D  summary(model.c)
##D  model.d <- exclude.influence(model.a, obs=1:10)
##D  summary(model.d)
##D  
##D  data(Penicillin, package="lme4")
##D  model.d <- lmer(diameter ~ (1|plate) + (1|sample), Penicillin)
##D  summary(model.d)
##D  model.e <- exclude.influence(model.d, grouping="sample", level="A", gf="all")
##D  summary(model.e)
## End(Not run)



