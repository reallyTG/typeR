library(sjPlot)


### Name: sjt.corr
### Title: Summary of correlations as HTML table
### Aliases: sjt.corr

### ** Examples

## Not run: 
##D # plot correlation matrix using circles
##D sjt.corr(mydf)
##D 
##D # Data from the EUROFAMCARE sample dataset
##D library(sjmisc)
##D data(efc)
##D 
##D # retrieve variable and value labels
##D varlabs <- get_label(efc)
##D 
##D # recveive first item of COPE-index scale
##D start <- which(colnames(efc) == "c83cop2")
##D # recveive last item of COPE-index scale
##D end <- which(colnames(efc) == "c88cop7")
##D 
##D # create data frame with COPE-index scale
##D mydf <- data.frame(efc[, c(start:end)])
##D colnames(mydf) <- varlabs[c(start:end)]
##D 
##D # we have high correlations here, because all items
##D # belong to one factor. See example from "sjp.pca".
##D sjt.corr(mydf, p.numeric = TRUE)
##D 
##D # auto-detection of labels, only lower triangle
##D sjt.corr(efc[, c(start:end)], triangle = "lower")
##D 
##D # auto-detection of labels, only lower triangle, all correlation
##D # values smaller than 0.3 are not shown in the table
##D sjt.corr(efc[, c(start:end)], triangle = "lower", val.rm = 0.3)
##D 
##D # auto-detection of labels, only lower triangle, all correlation
##D # values smaller than 0.3 are printed in blue
##D sjt.corr(efc[, c(start:end)], triangle = "lower",val.rm = 0.3,
##D          CSS = list(css.valueremove = 'color:blue;'))
## End(Not run)




