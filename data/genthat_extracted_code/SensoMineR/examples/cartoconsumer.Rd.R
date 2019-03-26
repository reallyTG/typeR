library(SensoMineR)


### Name: cartoconsumer
### Title: Preference Mapping Techniques and segmentation of consumers
### Aliases: cartoconsumer
### Keywords: multivariate models segmentation

### ** Examples

## Not run: 
##D ## Example 1: carto on the sensory descriptors
##D data(cocktail)
##D res.pca <- PCA(senso.cocktail)
##D results1 <- cartoconsumer(res.pca, hedo.cocktail)
##D results2 <- cartoconsumer(res.pca, hedo.cocktail,
##D       graph.hcpc=TRUE,graph.group=TRUE)
## End(Not run)

## Example 2
## Not run: 
##D data(cocktail)
##D res.mfa <- MFA(cbind.data.frame(senso.cocktail,compo.cocktail),
##D     group=c(ncol(senso.cocktail),ncol(compo.cocktail)),
##D     name.group=c("senso","compo"))
##D results3 <- cartoconsumer(res.mfa, hedo.cocktail)
## End(Not run)



