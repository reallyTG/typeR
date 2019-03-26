library(Factoshiny)


### Name: PCAshiny
### Title: Principal Component Analysis (PCA) with FactoShiny
### Aliases: PCAshiny

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(decathlon)
##D # Principal Component Analysis with Factoshiny:
##D res.shiny=PCAshiny(decathlon)
##D 
##D # Find your app the way you left it (by clicking on the "Quit the app" button)
##D res.shiny2=PCAshiny(res.shiny)
##D 
##D #PCAshiny on a result of a PCA
##D res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13)
##D res.shiny=PCAshiny(res.pca)
## End(Not run)



