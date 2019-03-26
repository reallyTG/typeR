library(Rcolombos)


### Name: quick_search
### Title: This method mimics the quick_search functionality of Colombos.
###   It takes a string containg the nickname for the selected organism and
###   a vector of string representing the genes of interest for the
###   specified organism and returns a list containing the locustags
###   (gene_names), contrasts and M-values for the current selection.
### Aliases: quick_search

### ** Examples

## Not run: 
##D  library("Rcolombos")
##D  my_module <- quick_search(organism="ecoli",
##D                      genes=c("b0400","b2805","b0567"),
##D                      geneNames=FALSE)
##D  heatmap(as.matrix(my_module), col=terrain.colors(15))
## End(Not run)



