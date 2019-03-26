library(phenopix)


### Name: PhenoDeriv
### Title: A function to extract thresholds
### Aliases: PhenoDeriv

### ** Examples

## Not run: 
##D data(bartlett2009.fitted)
##D derivatives.phenophases <- PhenoDeriv(
##D 	x=bartlett2009.fitted$fit$predicted, fit=bartlett2009.fitted$fit
##D 	)
##D plot(bartlett2009.fitted$fit$predicted)
##D abline(v=derivatives.phenophases[c(1:2,4)], col=palette())
##D mtext(names(derivatives.phenophases[c(1:2,4)]), 
##D 	at=derivatives.phenophases[c(1:2,4)], 
##D 	line=-2, 
##D 	col=palette()[1:3])
## End(Not run)



