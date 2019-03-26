library(ordinalCont)


### Name: ocm
### Title: Ordinal regression for continuous scales
### Aliases: ocm
### Keywords: likelihood, log-likelihood, ordinal regression.

### ** Examples

fit.overall  <- ocm(overall  ~ cycleno + age + bsa + treatment, data=ANZ0001.sub, scale=c(0,100))
summary(fit.overall)
## Not run: 
##D plot(fit.overall)
##D ## Smoothers and complete data set
##D fit.overall.smooth  <- ocm(overall  ~ age + treatment : s(cycleno), data=ANZ0001, scale=c(0,100))
##D summary(fit.overall.smooth)
##D plot(fit.overall.smooth)
## End(Not run)



