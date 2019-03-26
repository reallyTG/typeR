## ----style, echo = FALSE, results = 'asis'-------------------------------

## ------------------------------------------------------------------------
library("ape")
library("BoSSA")

## ------------------------------------------------------------------------
test_tree <- rtree(20)

## ----tree1, fig.width=5,fig.height=5-------------------------------------
circular_tree(test_tree)

## ----tree3, fig.width=5,fig.height=5-------------------------------------
coord <- circular_tree(test_tree,pos_out=TRUE,tip_labels=FALSE)
# lines between tips 1 and tips 6, 9 and 12
lines(c(coord[coord[,2]==1,4],coord[coord[,2]==6,4]),c(coord[coord[,2]==1,6],coord[coord[,2]==6,6]),col="red")
lines(c(coord[coord[,2]==1,4],coord[coord[,2]==9,4]),c(coord[coord[,2]==1,6],coord[coord[,2]==9,6]),col="red")
lines(c(coord[coord[,2]==1,4],coord[coord[,2]==12,4]),c(coord[coord[,2]==1,6],coord[coord[,2]==12,6]),col="red")
# lines between tip 19 and node 5
lines(c(coord[coord[,2]==19,4],coord[coord[,2]==length(test_tree$t)+5,4]),c(coord[coord[,2]==19,6],coord[coord[,2]==length(test_tree$t)+5,6]),col="blue")

## ------------------------------------------------------------------------
citation("BoSSA")

