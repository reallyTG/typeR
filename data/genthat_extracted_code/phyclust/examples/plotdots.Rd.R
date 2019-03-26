library(phyclust)


### Name: plotdots
### Title: Dots Plots of Sequences for Visual Comparisons
### Aliases: plotdots
### Keywords: plot

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # For nucleotide
##D X <- seq.data.toy$org
##D par(mfrow = c(2, 2))
##D plotdots(X)
##D plotdots(X, diff.only = FALSE)
##D plotdots(X, diff.only = FALSE, label = FALSE)
##D plotdots(X, fill = TRUE, diff.only = FALSE, label = FALSE)
##D 
##D # With class ids
##D X.class <- as.numeric(gsub(".*-(.*)", "\\1", seq.data.toy$seqname))
##D plotdots(X, X.class)
##D 
##D # For SNP
##D X.SNP <- nid2sid(X)
##D plotdots(X.SNP, X.class)
## End(Not run)



