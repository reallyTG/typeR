library(phenopix)


### Name: PhenoGu
### Title: A function to extract phenological thresholds according to Gu et
###   al. 2009
### Aliases: PhenoGu

### ** Examples

## Not run: 
##D data(bartlett2009.fitted)
##D gu.phenophases <- PhenoGu(x=bartlett2009.fitted$fit$params, 
##D 	fit=bartlett2009.fitted$fit, sf=quantile(bartlett2009.fitted$fit$predicted, c(0.1, 0.9)))
##D plot(bartlett2009.fitted$fit$predicted)
##D abline(v=gu.phenophases[1:4], col=palette())
##D mtext(names(gu.phenophases[1:4]), at=gu.phenophases[1:4], 
##D 	line=-2:-5, col=palette()[1:4])
## End(Not run)



