library(lavaSearch2)


### Name: symmetrize
### Title: Symmetrize a Matrix
### Aliases: symmetrize
### Keywords: internal

### ** Examples

symmetrize <- lavaSearch2:::symmetrize

## example
M <- matrix(NA, 4, 4)
M[lower.tri(M)] <- 1:6

symmetrize(M, update.upper = TRUE) # good

M[upper.tri(M, diag = FALSE)] <- M[lower.tri(M, diag = FALSE)]
M # wrong



