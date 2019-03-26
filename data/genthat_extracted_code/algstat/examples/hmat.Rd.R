library(algstat)


### Name: hmat
### Title: Construct a Hierarchical Model Matrix
### Aliases: hmat

### ** Examples

# LAS example 1.2.11, p.16
varlvls <- c(2,2,2,2)
facets <- list(c(1,2), c(1,4), c(2,3))
( A <- hmat(varlvls, facets) )

# 2x2 independence example
# following convention, the first index indicates rows
varlvls <- c(2,2)
facets <- list(1,2)
( A <- hmat(varlvls, facets) )

printForMarkov <- function(A){
  cat(paste(nrow(A), ncol(A)))
  cat("\n")
  cat(apply(unname(A), 1, paste, collapse = " "), sep = "\n")
  cat("\n")
}
printForMarkov(A)



