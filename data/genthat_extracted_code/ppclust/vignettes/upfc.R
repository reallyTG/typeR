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
x=iris[,-5]
x

## ----fig.width=7, fig.height=6-------------------------------------------
pairs(x, col=iris[,5])

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- matrix(nrow=3, ncol=4,
     c(5.0, 3.4, 1.4, 0.3,
       6.7, 3.0, 5.6, 2.1,
	   5.8, 2.7, 4.3, 1.4),
	   byrow=TRUE)
print(v0)
res.upfc <- upfc(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- inaparc::kmpp(x, k=3)$v
print(v0)
res.upfc <- upfc(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
u0 <- inaparc::imembrand(nrow(x), k=3)$u
res.upfc <- upfc(x, centers=3, memberships=u0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, alginitv="firstk", alginitu="imembrand")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, dmetric="euclidean")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, m=4)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, eta=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, a=3, b=2)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=3, rows.print=10----
res.upfc <- upfc(x, centers=3)
as.data.frame(res.upfc$u)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=3, rows.print=10----
as.data.frame(res.upfc$t)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc$v0
res.upfc$v

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.upfc)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, nstart=4)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc <- upfc(x, centers=3, nstart=4, fixmemb=TRUE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc$func.val
res.upfc$iter
res.upfc$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.upfc$best.start

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
res.upfc <- upfc(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.upfc)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.upfc, cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.upfc, cp=1, tv=0.25, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.upfc, mt="u", cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.upfc2 <- ppclust2(res.upfc, "kmeans")
factoextra::fviz_cluster(res.upfc2, data = x, 
  ellipse.type = "convex",
  palette = "jco",
  repel = TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.upfc3 <- ppclust2(res.upfc, "fanny")

cluster::clusplot(scale(x), res.upfc3$cluster,  
  main = "Cluster plot of Iris data set",
  color=TRUE, labels = 2, lines = 2, cex=1)

## ------------------------------------------------------------------------
res.upfc4 <- ppclust2(res.upfc, "fclust")
idxsf <- SIL.F(res.upfc4$Xca, res.upfc4$U, alpha=1)
idxpe <- PE(res.upfc4$U)
idxpc <- PC(res.upfc4$U)
idxmpc <- MPC(res.upfc4$U)

## ------------------------------------------------------------------------
cat("Partition Entropy: ", idxpe)
cat("Partition Coefficient: ", idxpc)
cat("Modified Partition Coefficient: ", idxmpc)
cat("Fuzzy Silhouette Index: ", idxsf)

