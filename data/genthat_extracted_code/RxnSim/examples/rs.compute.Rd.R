library(RxnSim)


### Name: rs.compute
### Title: Computes Similarity of Reactions
### Aliases: rs.compute rs.compute.list rs.compute.sim.matrix rs.compute.DB

### ** Examples

## Don't show: 
rct1 <- 'C(=O)C1(=CC=CC=C1).O=O.[OH2]>>[H+].C(C1(C=CC=CC=1))([O-])=O.OO'
rct2 <- 'C(C=CC1(=CC=CC=C1))=O.O=O.[OH2]>>[H+].C(=O)([O-])C=CC1(=CC=CC=C1).OO'
## End(Don't show)
## Not run: Reaction similarity using \'msim\' algorithm
rs.compute(rct1, rct2, verbose = TRUE)



