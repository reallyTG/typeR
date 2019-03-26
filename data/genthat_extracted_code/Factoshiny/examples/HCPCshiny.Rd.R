library(Factoshiny)


### Name: HCPCshiny
### Title: Hierarchical Clustering on Principal Components (HCPC) with
###   Factoshiny
### Aliases: HCPCshiny

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(decathlon)
##D # HCPC with Factoshiny on a result of a factor analysis:
##D res.pca <- PCA(decathlon, quanti.sup = 11:12, quali.sup=13)
##D res.shiny=HCPCshiny(res.pca)
##D 
##D # HCPC with Factoshiny on a dataframe:
##D data(wine)
##D res.shiny2=HCPCshiny(wine)
##D 
##D # Find your app the way you left it (by clicking on the "Quit the app" button)
##D res.shiny3=HCPCshiny(res.shiny2)
##D 
## End(Not run)



