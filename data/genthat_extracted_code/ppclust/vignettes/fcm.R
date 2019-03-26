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
res.fcm <- fcm(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- matrix(nrow=3, ncol=4,
     c(5.0, 3.4, 1.4, 0.3,
       6.7, 3.0, 5.6, 2.1,
	   5.8, 2.7, 4.3, 1.4),
	   byrow=TRUE)
print(v0)
res.fcm <- fcm(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- inaparc::kmpp(x, k=3)$v
print(v0)
res.fcm <- fcm(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
u0 <- inaparc::imembrand(nrow(x), k=3)$u
res.fcm <- fcm(x, centers=3, memberships=u0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3, alginitv="hartiganwong", alginitu="imembrand")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3, dmetric="correlation")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3, m=4)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=3, rows.print=10----
res.fcm <- fcm(x, centers=3)
as.data.frame(res.fcm$u)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm$v0
res.fcm$v

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.fcm)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3, nstart=5)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm <- fcm(x, centers=3, nstart=5, fixmemb=TRUE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm$func.val
res.fcm$iter
res.fcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.fcm$best.start

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.fcm)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.fcm, cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.fcm2 <- ppclust2(res.fcm, "kmeans")
factoextra::fviz_cluster(res.fcm2, data = x, 
  ellipse.type = "convex",
  palette = "jco",
  repel = TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.fcm3 <- ppclust2(res.fcm, "fanny")

cluster::clusplot(scale(x), res.fcm3$cluster,  
  main = "Cluster plot of Iris data set",
  color=TRUE, labels = 2, lines = 2, cex=1)

## ------------------------------------------------------------------------
res.fcm4 <- ppclust2(res.fcm, "fclust")
idxsf <- SIL.F(res.fcm4$Xca, res.fcm4$U, alpha=1)
idxpe <- PE(res.fcm4$U)
idxpc <- PC(res.fcm4$U)
idxmpc <- MPC(res.fcm4$U)

## ------------------------------------------------------------------------
cat("Partition Entropy: ", idxpe)
cat("Partition Coefficient: ", idxpc)
cat("Modified Partition Coefficient: ", idxmpc)
cat("Fuzzy Silhouette Index: ", idxsf)

