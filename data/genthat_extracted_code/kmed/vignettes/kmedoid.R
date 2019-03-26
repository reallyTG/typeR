## ------------------------------------------------------------------------
library(kmed)
num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
mrwdist[1:6,1:6]

## ------------------------------------------------------------------------
set.seed(1)
a <- matrix(sample(1:2, 7*3, replace = TRUE), 7, 3)
matching(a, a)
cooccur(a)

## ------------------------------------------------------------------------
a1 <- matrix(sample(1:3, 7*3, replace = TRUE), 7, 3)
mixdata <- cbind(iris[1:7,1:3], a, a1)
colnames(mixdata) <- c(paste(c("num"), 1:3, sep = ""), paste(c("bin"), 1:3, sep = ""), paste(c("cat"), 1:3, sep = ""))
mixdata
distmix(mixdata, method = "gower", idnum = 1:3, idbin = 4:6, idcat = 7:9)
distmix(mixdata, method = "wishart", idnum = 1:3, idbin = 4:6, idcat = 7:9)

## ------------------------------------------------------------------------
result <- fastkmed(mrwdist, ncluster = 3, iterate = 50)
(fastiris <- table(result$cluster, iris[,5]))
(misclass <- (1-sum(diag(fastiris))/length(iris[,5]))*100)

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
rownames(mrwdist) <- colnames(mrwdist) <- 1:nrow(mrwdist)
siliris <- silhoutte(mrwdist, result$medoid, result$cluster)
siliris$result[c(1:3,70:75,101:103),]
siliris$plot

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
shairis <- shadow(mrwdist, result$medoid, result$cluster)
shairis$result[c(1:3,70:75,101:103),]
shairis$plot

## ------------------------------------------------------------------------
k <- 3
# a simple and fast k-medoids function for bootstrap evaluation
parkboot <- function(x, nclust) {
  res <- fastkmed(x, nclust, iterate = 50)
  return(res$cluster)
}

# k-means function for bootstrap evaluation
kmboot <- function(x, nclust) {
  res <- kmeans(x, nclust)
  return(res$cluster)
}

## ------------------------------------------------------------------------
fastkmedboot <- clustboot(mrwdist, nclust=k, parkboot, nboot=50)
kmeansboot <- clustboot(num, nclust=k, kmboot, nboot=50, diss = FALSE)
fastkmedboot[1:5,c(1:5,46:50)]
kmeansboot[1:5,c(1:5,46:50)]

## ------------------------------------------------------------------------
wardorder <- function(x, nclust) {
  res <- hclust(x, method = "ward.D2")
  member <- cutree(res, nclust)
  return(member)
}
consensusfastkmed <- consensusmatrix(fastkmedboot, nclust = k, wardorder)
consensusfastkmed[c(1:5,51:55,101:105),c(1:5,51:55,101:105)]

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
clustheatmap(consensusfastkmed, "Iris Data via Fast K-medoids")

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
consensuskmeans <- consensusmatrix(kmeansboot, nclust = k, wardorder)
clustheatmap(consensuskmeans, "Iris Data via K-means")

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
pcadat <- prcomp(iris[,1:4], scale. = TRUE)
pcabiplot(pcadat, colobj = result$cluster)

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
pcadat <- prcomp(iris[,1:4], scale. = TRUE)
pcabiplot(pcadat, y = "PC3",colobj = result$cluster)

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
barplotnum(iris[,1:4], result$cluster)

## ---- fig.width=7, fig.asp=0.8-------------------------------------------
barplotnum(iris[,1:4], result$cluster, nc = 2)

