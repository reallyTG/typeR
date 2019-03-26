## ------------------------------------------------------------------------
library(optimus)

## ------------------------------------------------------------------------
data(swamps)
swamps <- swamps[,-1] # get rid of the site ID

## ------------------------------------------------------------------------
swamps_hclust <- hclust(d = dist(x = log1p(swamps), method = "canberra"),
                        method = "complete")

## ---- message=FALSE------------------------------------------------------
swamps_hclust_aics <- find_optimal(data = swamps, 
                                   clustering = swamps_hclust,
                                   family = "poisson",
                                   cutreeLevels = 2:40)

## ---- fig.width=6, fig.height=4------------------------------------------
head(swamps_hclust_aics)
plot(swamps_hclust_aics)

## ------------------------------------------------------------------------
swamps_kmeans <- lapply(X = 2:40,
                        FUN = function(x, data) {stats::kmeans(x = data, centers = x)$cluster},
                        data = swamps)

## ------------------------------------------------------------------------
table(swamps_kmeans[[3]])

## ---- fig.width=6, fig.height=4, message=FALSE---------------------------
swamps_kmeans_aics <- find_optimal(data = swamps, 
                                   clustering = swamps_kmeans,
                                   family = "poisson")
plot(swamps_kmeans_aics)

## ---- fig.width=6, fig.height=4------------------------------------------
plot(swamps_kmeans_aics)
points(swamps_hclust_aics, col = "red", pch = 16)
legend("topright", 
       legend = c("k-means", "hclust"), 
       col = c("black", "red"), pch = 16)

## ---- message=FALSE------------------------------------------------------
swamps_20groups <- cutree(tree = swamps_hclust, k = 20)
swamps_char <- get_characteristic(data = swamps,
                                  clustering = swamps_20groups,
                                  family = "poisson",
                                  type = "per.cluster")
print(swamps_char$clusterSolution1)

## ---- message=FALSE------------------------------------------------------
swamps_20groups <- cutree(tree = swamps_hclust, k = 20)
swamps_char_glob <- get_characteristic(data = swamps,
                                       clustering = swamps_20groups,
                                       family = "poisson",
                                       type = "global")
head(swamps_char_glob, 20)

## ---- message=FALSE------------------------------------------------------
swamps_30groups <- cutree(tree = swamps_hclust, k = 30)

swamps_aicmerge <- merge_clusters(data = swamps,
                                  clustering = swamps_30groups,
                                  family = "poisson",
                                  n.iter = 29)

## ------------------------------------------------------------------------
table(swamps_aicmerge[[21]])

## ---- fig.width=6, fig.height=4, message=FALSE---------------------------
swamps_aicmerge_aics <- find_optimal(data = swamps, 
                                     clustering = swamps_aicmerge,
                                     family = "poisson")

plot(swamps_aicmerge_aics, pch = 1)
points(swamps_hclust_aics, col = "red", pch = 1)
points(swamps_kmeans_aics, col = "blue", pch = 1)
legend("topright", 
       legend = c("aic-merge", "k-means", "hclust"), 
       col = c("black", "blue", "red"), pch = 1)

