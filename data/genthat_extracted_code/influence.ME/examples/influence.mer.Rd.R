library(influence.ME)


### Name: influence.mer
### Title: influence returns mixed model estimates, iteratively excluding
###   the influence of data nested within single grouping factors.
### Aliases: influence influence.mer
### Keywords: robust models regression

### ** Examples

## Not run: 
##D data(school23)
##D model.a <- lmer(math ~ structure + SES  + (1 | school.ID), data=school23)
##D alt.est.a <- influence(model=model.a, group="school.ID")
##D alt.est.b <- influence(model=model.a, group="school.ID", select="7472")
##D alt.est.c <- influence(model=model.a, group="school.ID", select=c("7472", "62821"))
##D 
##D #Note: does not work on models produced by exclude.influence()
##D model.b <- lmer(math ~ structure + scale(SES)  + (1 | school.ID), data=school23)
##D alt.est.d <- influence(model=model.b, group="school.ID", select=c("7472", "62821"))
##D 
##D data(Penicillin, package="lme4")
##D model.c <- lmer(diameter ~ (1|plate) + (1|sample), Penicillin)
##D alt.est.e <- influence(model=model.c, group="plate")
##D alt.est.f <- influence(model=model.c, group="sample")
##D alt.est.g <- influence(model=model.c, group="sample", gf="all")
##D 
## End(Not run)



