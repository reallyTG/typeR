library(sjPlot)


### Name: sjt.fa
### Title: Summary of factor analysis as HTML table
### Aliases: sjt.fa

### ** Examples

## Not run: 
##D # Data from the EUROFAMCARE sample dataset
##D library(sjmisc)
##D library(GPArotation)
##D data(efc)
##D 
##D # recveive first item of COPE-index scale
##D start <- which(colnames(efc) == "c82cop1")
##D # recveive last item of COPE-index scale
##D end <- which(colnames(efc) == "c90cop9")
##D # auto-detection of labels
##D sjt.fa(efc[, start:end])
## End(Not run)




