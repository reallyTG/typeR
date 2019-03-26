library(evidence)


### Name: Bregbf
### Title: Bayesian regression model comparison with Bayes factors.
### Aliases: Bregbf
### Keywords: models htest

### ** Examples

## Not run: 
##D data(PlantGrowth)
##D frmlst <- list(
##D model0 = formula(weight ~ 1),
##D model1 = formula(weight ~ group) )
##D Bregbf(form.list=frmlst, data=PlantGrowth)
##D data(fev)
##D frmlst.fev <- list(
##D formula(FEV ~ Age),
##D formula(FEV ~ Smoke),
##D formula(FEV ~ Age + Smoke),
##D formula(FEV ~ Age * Smoke)
##D )
##D Bregbf(frmlst.fev, fev)
## End(Not run)



