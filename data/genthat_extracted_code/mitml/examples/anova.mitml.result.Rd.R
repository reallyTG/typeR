library(mitml)


### Name: anova.mitml.result
### Title: Compare several nested models
### Aliases: anova.mitml.result
### Keywords: methods

### ** Examples

require(lme4)
data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# simple comparison (same as testModels)
fit0 <- with(implist, lmer(ReadAchiev ~ (1|ID), REML=FALSE))
fit1 <- with(implist, lmer(ReadAchiev ~ ReadDis + (1|ID), REML=FALSE))
anova(fit1,fit0)

## Not run: 
##D # multiple comparisons
##D fit2 <- with(implist, lmer(ReadAchiev ~ ReadDis + (1+ReadDis|ID), REML=FALSE))
##D anova(fit2,fit1,fit0)
## End(Not run)



