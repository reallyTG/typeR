library(ALA4R)


### Name: occurrences_plot
### Title: Quick geographic plot of occurrence data
### Aliases: occurrences_plot

### ** Examples

## Not run: 
##D  
##D ## download some observations
##D x <- occurrences(taxon="Eucalyptus gunnii", download_reason_id=10)
##D occurrences_plot(x)
##D 
##D x <- occurrences(taxon="Cider Gum", download_reason_id=10)
##D occurrences_plot(x, "alaPlot.pdf", qa="fatal", grouped=FALSE, taxon_level="species", pch="+")
## End(Not run)



