library(FRK)


### Name: manifold
### Title: Retrieve manifold
### Aliases: manifold manifold,Basis-method manifold,TensorP_Basis-method

### ** Examples

G <-  local_basis(manifold = plane(),
                   loc=matrix(0,1,2),
                   scale=0.2,
                   type="bisquare")
manifold(G)



