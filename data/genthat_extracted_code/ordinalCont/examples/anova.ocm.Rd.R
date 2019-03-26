library(ordinalCont)


### Name: anova.ocm
### Title: Anova method for Continuous Ordinal Fits
### Aliases: anova.ocm
### Keywords: anova

### ** Examples

## Not run: 
##D fit.overall  <- ocm(overall  ~ cycleno + bsa + treatment, data=ANZ0001.sub, scale=c(0,100))
##D anova(fit.overall, update(fit.overall, .~. + age))
## End(Not run)



