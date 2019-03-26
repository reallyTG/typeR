library(SensoMineR)


### Name: carto
### Title: Preference Mapping Techniques
### Aliases: carto
### Keywords: multivariate models

### ** Examples

## Not run: 
##D ## Example 1: carto for the sensory descriptors
##D data(cocktail)
##D res.pca <- PCA(senso.cocktail)
##D res.carto <- carto(res.pca$ind$coord[,1:2], hedo.cocktail)
##D 
##D ## Example 2
##D data(cocktail)
##D res.mfa <- MFA(cbind.data.frame(senso.cocktail,compo.cocktail),
##D     group=c(ncol(senso.cocktail),ncol(compo.cocktail)),
##D     name.group=c("senso","compo"))
##D res.carto <- carto(res.mfa$ind$coord[,1:2], hedo.cocktail)
## End(Not run)



