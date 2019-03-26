library(DGM)


### Name: rmdiag
### Title: Removes diagonal of NA's from matrix.
### Aliases: rmdiag

### ** Examples

M=array(rnorm(3*3), dim=c(3,3))
M[as.logical(diag(3))] = NA
M=rmna(M)



