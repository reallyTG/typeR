library(phyclust)


### Name: plothist
### Title: Plot Histogram to Compare Number of Mutations.
### Aliases: plothist
### Keywords: plot

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D X <- seq.data.toy$org
##D plothist(X)
##D 
##D # With class ids
##D X.class <- as.numeric(gsub(".*-(.*)", "\\1", seq.data.toy$seqname))
##D plothist(X, X.class)
## End(Not run)



