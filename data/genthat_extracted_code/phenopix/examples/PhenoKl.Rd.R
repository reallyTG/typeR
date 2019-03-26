library(phenopix)


### Name: PhenoKl
### Title: A function to extract phenological thresholds according to
###   Klosterman et al. 2014
### Aliases: PhenoKl

### ** Examples

## Not run: 
##D data(bartlett2009.fitted)
##D klosterman.phenophases <- PhenoKl(
##D 	x=bartlett2009.fitted$fit$params, 
##D 	fit=bartlett2009.fitted$fit)
##D plot(bartlett2009.fitted$fit$predicted)
##D abline(v=klosterman.phenophases[1:4], col=palette())
##D mtext(names(klosterman.phenophases[1:4]), 
##D 	at=klosterman.phenophases[1:4], line=-2:-5, 
##D 	col=palette()[1:4])
## End(Not run)



