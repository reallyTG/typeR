## ------------------------------------------------------------------------
#loads package
library("mstknnclust")

## ------------------------------------------------------------------------
#loads dataset
data(dslanguages)

## ---- echo=FALSE---------------------------------------------------------
knitr::kable(dslanguages[1:6,1:6],digits=6,row.names=TRUE, caption = "Distance between first six objects to group")

## ------------------------------------------------------------------------
#Performs MST-kNN clustering using languagesds distance matrix
results <- mst.knn(dslanguages)

## ---- echo=FALSE---------------------------------------------------------
cat("Number of clusters: ", results$k , "\n")
cat("Objects by cluster: ", results$csize, "\n")
cat("Named vector of cluster allocation: \n")
results$cluster
cat("Data matrix partition (partial): \n")
knitr::kable(tail(results$partition,10), row.names = FALSE) 

## ---- fig.align = "center", fig.height = 7, fig.width = 7----------------
library("igraph")
igraph::V(results$network)$label.cex <- seq(0.6,0.6,length.out=2)
plot(results$network,
     vertex.size=5,
     vertex.label.dist=0.30, 
     vertex.color=igraph::clusters(results$network)$membership,
     layout=igraph::layout.fruchterman.reingold(results$network, niter=10000))

