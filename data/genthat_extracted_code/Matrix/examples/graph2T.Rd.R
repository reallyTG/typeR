library(Matrix)


### Name: graph-sparseMatrix
### Title: Conversions "graph" <-> (sparse) Matrix
### Aliases: graph2T T2graph coerce,graph,Matrix-method
###   coerce,graph,sparseMatrix-method coerce,graph,CsparseMatrix-method
###   coerce,graphAM,sparseMatrix-method
###   coerce,graphNEL,CsparseMatrix-method
###   coerce,graphNEL,TsparseMatrix-method coerce,sparseMatrix,graph-method
###   coerce,sparseMatrix,graphNEL-method
###   coerce,TsparseMatrix,graphNEL-method coerce,dgTMatrix,graphNEL-method
### Keywords: graph utilities

### ** Examples

if(isTRUE(try(require(graph)))) { ## super careful .. for "checking reasons"
  n4 <- LETTERS[1:4]; dns <- list(n4,n4)
  show(a1 <- sparseMatrix(i= c(1:4),   j=c(2:4,1),   x = 2,    dimnames=dns))
  show(g1 <- as(a1, "graph")) # directed
  unlist(edgeWeights(g1)) # all '2'

  show(a2 <- sparseMatrix(i= c(1:4,4), j=c(2:4,1:2), x = TRUE, dimnames=dns))
  show(g2 <- as(a2, "graph")) # directed
  # now if you want it undirected:
  show(g3  <- T2graph(as(a2,"TsparseMatrix"), edgemode="undirected"))
  show(m3 <- as(g3,"Matrix"))
  show( graph2T(g3) ) # a "pattern Matrix" (nsTMatrix)
## Don't show: 
  stopifnot(
   identical(as(g3,"Matrix"), as(as(a2 + t(a2), "nMatrix"),"symmetricMatrix"))
  ,
   identical(tg3 <- graph2T(g3), graph2T(g3, use.weights=FALSE))
  ,
   identical(as(m3,"TsparseMatrix"), uniqTsparse(tg3))
  )
## End(Don't show)
  a. <- sparseMatrix(i= 4:1, j=1:4, dimnames=list(n4,n4), giveC=FALSE) # no 'x'
  show(a.) # "ngTMatrix"
  show(g. <- as(a., "graph"))
## Don't show: 
  stopifnot(edgemode(g.) == "undirected", numEdges(g.) == 2,
            all.equal(as(g., "TsparseMatrix"),
                      as(a., "symmetricMatrix"))
)
## End(Don't show)
}



