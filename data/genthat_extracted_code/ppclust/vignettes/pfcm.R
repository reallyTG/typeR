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
res.pfcm <- pfcm(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- matrix(nrow=3, ncol=4,
     c(5.0, 3.4, 1.4, 0.3,
       6.7, 3.0, 5.6, 2.1,
	   5.8, 2.7, 4.3, 1.4),
	   byrow=TRUE)
print(v0)
res.pfcm <- pfcm(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
v0 <- inaparc::kmpp(x, k=3)$v
print(v0)
res.pfcm <- pfcm(x, centers=v0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
u0 <- inaparc::imembrand(nrow(x), k=3)$u
res.pfcm <- pfcm(x, centers=3, memberships=u0)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, alginitv="firstk", alginitu="imembrand")

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- fcm(x, centers=3)
res.pfcm <- pfcm(x, centers=res.fcm$v, memberships=res.fcm$u)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, m=4)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, eta=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, a=2, b=3)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=3, rows.print=10----
res.pfcm <- pfcm(x, centers=3)
as.data.frame(res.pfcm$u)

## ----echo=TRUE, message=FALSE, warning=FALSE, cols.print=3, rows.print=10----
as.data.frame(res.pfcm$t)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm$v0
res.pfcm$v

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.pfcm)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, nstart=4)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm <- pfcm(x, centers=3, nstart=4, fixmemb=TRUE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm$func.val
res.pfcm$iter
res.pfcm$comp.time

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
res.pfcm$best.start

## ----echo=FALSE, message=FALSE, warning=FALSE----------------------------
res.pfcm <- pfcm(x, centers=3)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
summary(res.pfcm)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.pfcm, cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.pfcm, cp=1, tv=0.2, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
plotcluster(res.pfcm, mt="u", cp=1, trans=TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.pfcm2 <- ppclust2(res.pfcm, "kmeans")
factoextra::fviz_cluster(res.pfcm2, data = x, 
  ellipse.type = "convex",
  palette = "jco",
  repel = TRUE)

## ----fig.width=7, fig.height=6-------------------------------------------
res.pfcm3 <- ppclust2(res.pfcm, "fanny")

cluster::clusplot(scale(x), res.pfcm3$cluster,  
  main = "Cluster plot of Iris data set",
  color=TRUE, labels = 2, lines = 2, cex=1)

## ------------------------------------------------------------------------
res.pfcm4 <- ppclust2(res.pfcm, "fclust")
idxsf <- SIL.F(res.pfcm4$Xca, res.pfcm4$U, alpha=1)
idxpe <- PE(res.pfcm4$U)
idxpc <- PC(res.pfcm4$U)
idxmpc <- MPC(res.pfcm4$U)

## ------------------------------------------------------------------------
cat("Partition Entropy: ", idxpe)
cat("Partition Coefficient: ", idxpc)
cat("Modified Partition Coefficient: ", idxmpc)
cat("Fuzzy Silhouette Index: ", idxsf)

