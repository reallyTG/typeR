## ----message=FALSE-------------------------------------------------------
library(PINSPlus)
data(AML2004)

## ------------------------------------------------------------------------
system.time(result <- PerturbationClustering(data = AML2004$Gene, verbose = FALSE))

## ---- eval=FALSE---------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, ncore = 8)

## ------------------------------------------------------------------------
result$k

## ------------------------------------------------------------------------
result$cluster

## ------------------------------------------------------------------------
condition <- seq(unique(AML2004$Group[, 2]))
names(condition) = unique(AML2004$Group[, 2])
plot(prcomp(AML2004$Gene)$x, col = result$cluster, 
     pch = condition[AML2004$Group[, 2]], main = "AML2004")
legend("bottomright", legend = paste("Cluster ", sort(unique(result$cluster)), sep = ""),
        fill = sort(unique(result$cluster)))
legend("bottomleft", legend = names(condition), pch = condition)

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, kMax = 10,
#                                   clusteringMethod = "kmeans")

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, kMax = 10,
#                                   clusteringMethod = "pam")

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, kMax = 10,
#                                   clusteringMethod = "hclust")

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(
#      data = AML2004$Gene,
#      clusteringMethod = "kmeans",
#      clusteringOptions = list(nstart = 100, iter.max = 500),
#      verbose = FALSE
#  )

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene,
#      clusteringFunction = function(data, k){
#      # this function must return a vector of cluster
#      kmeans(x = data, centers = k, nstart = k*10, iter.max = 2000)$cluster
#  })

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene,
#                                   perturbMethod = "noise",
#                                   perturbOptions = list(noise = 1.23))

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene,
#                                   perturbMethod = "noise",
#                                   perturbOptions = list(noisePercent = 10))

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene,
#                                   perturbMethod = "subsampling",
#                                   perturbOptions = list(percent = 80))

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, perturbFunction = function(data){
#      rowNum <- nrow(data)
#      colNum <- ncol(data)
#      epsilon <-
#          matrix(
#              data = rnorm(rowNum * colNum, mean = 0, sd = 1.23456),
#              nrow = rowNum, ncol = colNum
#          )
#  
#      list(
#          data = data + epsilon,
#          ConnectivityMatrixHandler = function(connectivityMatrix, iter, k) {
#              connectivityMatrix
#          }
#      )
#  })

## ----eval=FALSE----------------------------------------------------------
#  result <- PerturbationClustering(data = AML2004$Gene, iterMax = 200,
#                                   iterMin = 10, madMin = 1e-2, msdMin = 1e-4)

## ----eval=FALSE----------------------------------------------------------
#  # Load the kidney cancer carcinoma data
#  data(KIRC)
#  # SubtypingOmicsData`'s input data must be a list of
#  # numeric matrices or data frames that have the same number of rows:
#  dataList <- list (KIRC$GE, KIRC$ME, KIRC$MI)
#  names(dataList) <- c("GE", "ME", "MI")
#  # Run `SubtypingOmicsData`:
#  result <- SubtypingOmicsData(dataList = dataList)

## ----eval=FALSE----------------------------------------------------------
#  result <- SubtypingOmicsData(
#      dataList = dataList,
#      clusteringMethod = "kmeans",
#      clusteringOptions = list(nstart = 50)
#  )

## ----eval=FALSE----------------------------------------------------------
#  library(survival)
#  cluster1=result$cluster1;cluster2=result$cluster2
#  a <- intersect(unique(cluster2), unique(cluster1))
#  names(a) <- intersect(unique(cluster2), unique(cluster1))
#  a[setdiff(unique(cluster2), unique(cluster1))] <-
#      seq(setdiff(unique(cluster2), unique(cluster1))) + max(cluster1)
#  colors <- a[levels(factor(cluster2))]
#  coxFit <- coxph(
#       Surv(time = Survival, event = Death) ~ as.factor(cluster2),
#       data = KIRC$survival,
#       ties = "exact"
#  )
#  mfit <- survfit(Surv(Survival, Death == 1) ~ as.factor(cluster2), data = KIRC$survival)
#  plot(
#       mfit, col = colors, main = "Survival curves for KIRC, level 2",
#       xlab = "Days", ylab = "Survival",lwd = 2
#  )
#  legend("bottomright",
#      legend = paste(
#          "Cox p-value:", round(summary(coxFit)$sctest[3], digits = 5), sep = ""
#      )
#  )
#  legend(
#      "bottomleft",
#      fill = colors,
#      legend = paste("Group ", levels(factor(cluster2)), ": ",
#          table(cluster2)[levels(factor(cluster2))], sep =""
#      )
#  )

