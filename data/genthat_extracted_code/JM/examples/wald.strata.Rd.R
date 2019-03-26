library(JM)


### Name: wald.strata
### Title: Wald Test for Stratification Factors
### Aliases: wald.strata
### Keywords: multivariate regression

### ** Examples

## Not run: 
##D fitLME <- lme(log(serBilir) ~ drug * year - drug, random = ~ year | id, 
##D     data = pbc2)
##D fitSURV <- coxph(Surv(years, status2) ~ drug + strata(hepatomegaly), 
##D     data = pbc2.id, x = TRUE)
##D fit.pbc <- jointModel(fitLME, fitSURV, timeVar = "year", method = "spline-PH-aGH")
##D wald.strata(fit.pbc)
## End(Not run)



