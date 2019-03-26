library(ScreenClean)


### Name: FindCG
### Title: Find the connected subgraphs with a certain number of nodes
### Aliases: FindCG
### Keywords: graph connected subgraph

### ** Examples


require(MASS)
require(Matrix)
p <- 10
Omega <- sparseMatrix(c(1:(p-1),2:p),c(2:p,1:(p-1)),x=1)
cg.2 <- FindCG(Omega,c(1:p))
cg.3 <- FindCG(Omega,cg.2)




