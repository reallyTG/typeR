library(psych)


### Name: factor.fit
### Title: How well does the factor model fit a correlation matrix. Part of
###   the VSS package
### Aliases: factor.fit
### Keywords: models models

### ** Examples

## Not run: 
##D #compare the fit of 4 to 3 factors for the Harman 24 variables
##D fa4 <- factanal(x,4,covmat=Harman74.cor$cov)
##D round(factor.fit(Harman74.cor$cov,fa4$loading),2)
##D #[1] 0.9
##D fa3 <- factanal(x,3,covmat=Harman74.cor$cov)
##D round(factor.fit(Harman74.cor$cov,fa3$loading),2)
##D #[1] 0.88
##D 
## End(Not run)




