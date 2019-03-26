library(Factoshiny)


### Name: MCAshiny
### Title: Multiple Correspondence Analysis (MCA) with Factoshiny
### Aliases: MCAshiny

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(poison)
##D # Multiple Correspondance Analysis with Factoshiny:
##D res.shiny=MCAshiny(poison)
##D 
##D # Find your app the way you left it (by clicking on the "Quit the app" button)
##D res.shiny2=MCAshiny(res.shiny)
##D 
##D #MCAshiny on a result of a MCA
##D data(hobbies)
##D res.mca <- MCA(hobbies,quali.sup=19:22,quanti.sup=23)
##D res.shiny=MCAshiny(res.mca)
## End(Not run)



