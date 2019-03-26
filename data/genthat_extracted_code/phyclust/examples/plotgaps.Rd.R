library(phyclust)


### Name: plotgaps
### Title: Gaps Plots of Sequences for Visual Comparisons
### Aliases: plotgaps
### Keywords: plot

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D # For nucleotide
##D set.seed(1234)
##D X <- seq.data.toy$org
##D X[sample(c(T, F), length(X), replace = TRUE, prob = c(0.05, 0.95))] <-
##D   .nucleotide$nid[.nucleotide$code == "-"]
##D plotgaps(X)
## End(Not run)



