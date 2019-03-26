library(Factoshiny)


### Name: CAshiny
### Title: Correspondance Analysis (CA) with Factoshiny
### Aliases: CAshiny

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(children)
##D # Correspondance Analysis with Factoshiny:
##D res.shiny=CAshiny(children)
##D 
##D # Find your app the way you left it (by clicking on the "Quit the app" button)
##D res.shiny2=CAshiny(res.shiny)
##D 
##D #CAshiny on a result of a CA
##D data(children)
##D res.ca <- CA (children, row.sup = 15:18, col.sup = 6:8)
##D res.shiny=CAshiny(res.ca)
## End(Not run)



