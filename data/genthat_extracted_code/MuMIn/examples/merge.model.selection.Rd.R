library(MuMIn)


### Name: merge.model.selection
### Title: Combine model selection tables
### Aliases: merge.model.selection rbind.model.selection
###   append.model.selection
### Keywords: manip

### ** Examples

## Not run: 
##D require(mgcv)
##D 
##D ms1 <- dredge(glm(Prop ~ dose + I(dose^2) + log(dose) + I(log(dose)^2),
##D     data = Beetle, family = binomial, na.action = na.fail))
##D 	
##D fm2 <- gam(Prop ~ s(dose, k = 3), data = Beetle, family = binomial)
##D 
##D merge(ms1, model.sel(fm2))
## End(Not run)



