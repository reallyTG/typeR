library(sjPlot)


### Name: sjt.itemanalysis
### Title: Summary of item analysis of an item scale as HTML table
### Aliases: sjt.itemanalysis

### ** Examples

# Data from the EUROFAMCARE sample dataset
library(sjmisc)
library(sjlabelled)
data(efc)

# retrieve variable and value labels
varlabs <- get_label(efc)

# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# create data frame with COPE-index scale
mydf <- data.frame(efc[, start:end])
colnames(mydf) <- varlabs[start:end]

## Not run: 
##D sjt.itemanalysis(mydf)
##D 
##D # auto-detection of labels
##D sjt.itemanalysis(efc[, start:end])
##D 
##D # Compute PCA on Cope-Index, and perform a
##D # item analysis for each extracted factor.
##D factor.groups <- sjt.pca(mydf)$factor.index
##D sjt.itemanalysis(mydf, factor.groups)
## End(Not run)




