library(ScreenClean)


### Name: FindAllCG
### Title: Find all the connected subgraphs whose size <= lc
### Aliases: FindAllCG
### Keywords: graph connected subgraph

### ** Examples

require(MASS)
require(Matrix)
p <- 10
Omega <- sparseMatrix(c(1:(p-1),2:p),c(2:p,1:(p-1)),x=1)
cg.all <- FindAllCG(Omega,3)




