## ---- echo=FALSE, message=FALSE------------------------------------------
# Load dependencies
library(plyr)
library(magrittr)
library(ggplot2)
library(clusternomics)

## ------------------------------------------------------------------------
set.seed(1)

# Number of elements in each cluster, follows the table given above
groupCounts <- c(50, 10, 40, 60)
# Centers of clusters
means <- c(-1.5,1.5)
# Helper function to generate test data
testData <- generateTestData_2D(groupCounts, means)
datasets <- testData$data

## ---- fig.width=6--------------------------------------------------------
qplot(datasets[[1]][,1], datasets[[1]][,2], col=factor(testData$groups)) + 
  geom_point(size=3) + 
  ggtitle("Context 1") + xlab("x") + ylab("y") +
  scale_color_discrete(name="Cluster")

## ---- fig.width=6--------------------------------------------------------
qplot(datasets[[2]][,1], datasets[[2]][,2], col=factor(testData$groups)) +
  geom_point(size=3) + 
  ggtitle("Context 2") + xlab("x") + ylab("y") +
  scale_color_discrete(name="Cluster")

## ------------------------------------------------------------------------
# Setup of the algorithm
dataDistributions <- 'diagNormal'
# Pre-specify number of clusters
clusterCounts <- list(global=10, context=c(3,3))
# Set number of iterations
# The following is ONLY FOR SIMULATION PURPOSES 
# Use larger number of iterations for real-life data
maxIter <- 300  
burnin <- 200
lag <- 2  # Thinning of samples

## ----runSampling, message=F----------------------------------------------
# Run context-dependent clustering
results <- contextCluster(datasets, clusterCounts, 
              maxIter = maxIter, burnin = burnin, lag = lag,
              dataDistributions = 'diagNormal',
              verbose = F)

# Extract resulting cluster assignments
samples <- results$samples  

# Extract global cluster assignments for each MCMC sample
clusters <- 
  laply(1:length(samples), function(i) samples[[i]]$Global) 

## ---- fig.width=6--------------------------------------------------------
logliks <- results$logliks

qplot(1:maxIter, logliks) + geom_line() + 
  xlab("MCMC iterations") +
  ylab("Log likelihood")

## ------------------------------------------------------------------------
wrongClusterCounts <- list(global=2, context=c(2,1))
worseResults <- 
  contextCluster(datasets, wrongClusterCounts, 
              maxIter = maxIter, burnin = burnin, lag = lag,
              dataDistributions = 'diagNormal',
              verbose = F)

print(paste('Original model has lower (better) DIC:', results$DIC))
print(paste('Worse model has higher (worse) DIC:', worseResults$DIC))

## ---- fig.width=6--------------------------------------------------------
cc <- numberOfClusters(clusters)
qplot(seq(from=burnin, to = maxIter, by=lag), cc) + 
  geom_line() + xlab("MCMC iterations") + ylab("Number of clusters") 

## ---- fig.width=6--------------------------------------------------------
clusterLabels <- unique(clusters %>% as.vector)
sizes <- matrix(nrow=nrow(clusters), ncol=length(clusterLabels)) 
for (ci in 1:length(clusterLabels)) {
  sizes[,ci] <- rowSums(clusters == clusterLabels[ci])
}
sizes <- sizes %>% as.data.frame
colnames(sizes) <- clusterLabels

boxplot(sizes,xlab="Global combined clusters", ylab="Cluster size")

## ------------------------------------------------------------------------
clusteringResult <- samples[[length(samples)]]

## ---- message=F, fig.width=5, fig.height=5-------------------------------
# Compute the co-clustering matrix from global cluster assignments
coclust <- coclusteringMatrix(clusters)

# Plot the co-clustering matrix as a heatmap
require(gplots)
mypalette <- colorRampPalette(rev(c('#d7191c','#fdae61','#ffffbf','#abd9e9','#4395d2')), 
                              space = "Lab")(100)
h <- heatmap.2(
  coclust, 
  col=mypalette, trace='none',
  dendrogram='row', labRow='', labCol='', key = TRUE,
  keysize = 1.5, density.info=c("none"),
  main="MCMC co-clustering matrix",
  scale = "none")

## ------------------------------------------------------------------------
diag(coclust) <- 1
fit <- hclust(as.dist(1 - coclust))
hardAssignments <- cutree(fit, k=4)

## ---- message=FALSE, fig.width=6-----------------------------------------
aris <- laply(1:nrow(clusters), 
              function(i) mclust::adjustedRandIndex(clusters[i,], testData$groups)) %>%
  as.data.frame
colnames(aris) <- "ARI"
aris$Iteration <- seq(from=burnin, to=maxIter, by=lag)
coclustAri <- mclust::adjustedRandIndex(hardAssignments, testData$groups)
aris$Coclust <- coclustAri
  
ggplot(aris, aes(x=Iteration, y=ARI, colour="MCMC iterations")) +
  geom_point() +
  ylim(0,1) +
  geom_smooth(size=1) + 
  theme_bw() +
  geom_line(aes(x=Iteration, y=Coclust, colour="Co-clustering matrix"), size=1) +
  scale_colour_discrete(name="Cluster assignments")


