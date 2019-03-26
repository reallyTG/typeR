library(phyclust)


### Name: plotstruct
### Title: Struct Plots of Observations Based on Posterior Probabilities
### Aliases: plotstruct
### Keywords: plot

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D set.seed(1234)
##D ret.1 <- phyclust(seq.data.toy$org, 3)
##D plotstruct(ret.1$Z.normalized)
##D windows()
##D plotstruct(ret.1$Z.normalized, sort.inside.class = FALSE)
##D 
##D # With class ids
##D X.class <- as.numeric(gsub(".*-(.*)", "\\1", seq.data.toy$seqname))
##D windows()
##D plotstruct(ret.1$Z.normalized, X.class = X.class)
## End(Not run)



