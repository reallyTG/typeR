library(FRK)


### Name: local_basis
### Title: Construct a set of local basis functions
### Aliases: local_basis radial_basis

### ** Examples

library(ggplot2)
G <-  local_basis(manifold = real_line(),
                   loc=matrix(1:10,10,1),
                   scale=rep(2,10),
                   type="bisquare")
## Not run: show_basis(G)



