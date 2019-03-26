## ---- eval=FALSE, message=FALSE, warning=FALSE---------------------------
#  install.packages("ppclust")

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
library(ppclust)

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
library(factoextra)
library(cluster)
library(fclust)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=5, rows.print=10----
data(iris)
x=iris[,1:4]
head(x, 5)
tail(x, 5)

## ----fig.width=7, fig.height=6-------------------------------------------
pairs(x, col=iris[,5])

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3, alginitv="inofrep")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3)
res.pcm <- pcm(x, centers=res.fcm$v, memberships=res.fcm$u)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3, dmetric="euclidean")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3, eta=4)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3)
head(res.pcm$t, 5)
tail(res.pcm$t, 5)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm$v0
res.pcm$v

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.pcm)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3, nstart=5)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm <- pcm(x, centers=3, nstart=5, fixmemb=TRUE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm$func.val
res.pcm$iter
res.pcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pcm$best.start

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.pcm)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.pcm, cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.pcm, cp=1, tv=0.2, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.pcm2 <- ppclust2(res.pcm, "kmeans")
factoextra::fviz_cluster(res.pcm2, data = x, 
  ellipse.type = "convex",
  palette = "jco",
  repel = TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.pcm3 <- ppclust2(res.pcm, "fanny")

cluster::clusplot(scale(x), res.pcm3$cluster,  
  main = "Cluster plot of Iris data set",
  color=TRUE, labels = 2, lines = 2, cex=1)

