library(JMbayes)


### Name: predict
### Title: Predictions for Joint Models
### Aliases: predict.JMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * year, data = pbc2,
##D     random = ~ year | id)
##D # survival regression fit
##D fitSURV <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, 
##D     x = TRUE)
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModelBayes(fitLME, fitSURV, timeVar = "year")
##D 
##D DF <- with(pbc2, expand.grid(drug = levels(drug),
##D     year = seq(min(year), max(year), len = 100)))
##D Ps <- predict(fitJOINT, DF, interval = "confidence", return = TRUE)
##D require(lattice)
##D xyplot(pred + low + upp ~ year | drug, data = Ps,
##D     type = "l", col = c(2,1,1), lty = c(1,2,2), lwd = 2,
##D     ylab = "Average log serum Bilirubin")
##D 
##D 
##D # Subject-specific predictions
##D ND <- pbc2[pbc2$id == 2, ]
##D Ps.ss <- predict(fitJOINT, ND, type = "Subject",
##D   interval = "confidence", return = TRUE)
##D xyplot(pred + low + upp ~ year | id, data = Ps.ss,
##D     type = "l", col = c(2,1,1), lty = c(1,2,2), lwd = 2,
##D     ylab = "Average log serum Bilirubin")
## End(Not run)



