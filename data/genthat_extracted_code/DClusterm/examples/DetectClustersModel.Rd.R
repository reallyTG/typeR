library(DClusterm)


### Name: DetectClustersModel
### Title: Detects clusters and computes their significance.
### Aliases: DetectClustersModel

### ** Examples

library("DClusterm")
data("NY8")

NY8$Observed <- round(NY8$Cases)
NY8$Expected  <- NY8$POP8 * sum(NY8$Observed) / sum(NY8$POP8)

NY8$x <- coordinates(NY8)[, 1]
NY8$y <- coordinates(NY8)[, 2]


#Model to account for covariates
ny.m1 <- glm(Observed ~ offset(log(Expected)) + PCTOWNHOME + PCTAGE65P +
PEXPOSURE, family = "poisson", data = NY8)

#Indices of areas that are possible cluster centres
idxcl <- c(120, 12, 89, 139, 146)

#Cluster detection adjusting for covariates
ny.cl1 <- DetectClustersModel(NY8,
thegrid = as.data.frame(NY8)[idxcl, c("x", "y")],
fractpop = 0.15, alpha = 0.05,
typeCluster = "S", R = NULL, model0 = ny.m1,
ClusterSizeContribution = "POP8")

#Display results
ny.cl1




