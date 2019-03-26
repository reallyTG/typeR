library(JMbayes)


### Name: IndvPred_lme
### Title: Individualized Predictions from Linear Mixed Models
### Aliases: IndvPred_lme extract_lmeComponents
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * ns(year, 2), data = subset(pbc2, id != 2), 
##D         random = ~ ns(year, 2) | id)
##D         
##D DF <- IndvPred_lme(fitLME, newdata = subset(pbc2, id == 2), timeVar = "year", 
##D     M = 500, return_data = TRUE)
##D     
##D require(lattice)
##D xyplot(pred + low + upp ~ year | id, data = DF,
##D     type = "l", col = c(2,1,1), lty = c(1,2,2), lwd = 2,
##D     ylab = "Average log serum Bilirubin")
##D     
##D # extract_lmeComponents() extract the required components from the lme object
##D # that are required to calculate the predictions; this is a light weight version of
##D # the object, e.g.,
##D fitLME_light <- extract_lmeComponents(fitLME, timeVar = "year")
##D 
##D DF <- IndvPred_lme(fitLME_light, newdata = subset(pbc2, id == 2), timeVar = "year", 
##D     M = 500, return_data = TRUE)
## End(Not run)



