library(sjPlot)


### Name: sjt.pca
### Title: Summary of principal component analysis as HTML table
### Aliases: sjt.pca

### ** Examples

## Not run: 
##D # Data from the EUROFAMCARE sample dataset
##D library(sjmisc)
##D data(efc)
##D 
##D # recveive first item of COPE-index scale
##D start <- which(colnames(efc) == "c82cop1")
##D # recveive last item of COPE-index scale
##D end <- which(colnames(efc) == "c90cop9")
##D # auto-detection of labels
##D sjt.pca(efc[, start:end])
## End(Not run)




