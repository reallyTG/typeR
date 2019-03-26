## ------------------------------------------------------------------------
library(BClustLonG,quietly=TRUE)
data(data)
str(data)
head(data.frame(ID=data$ID,years=data$years,data$Y),n=10)

## ---- results='hide'-----------------------------------------------------
## run BClustLonG and get the clustering results ##
res = BClustLonG(data, iter=500, thin=2,savePara=FALSE, infoVar="both",factor=TRUE)
mat = calSim(t(res$e.mat[,101:500])) ## calculate the posterior similarity matrix
clust = maxpear(mat)$cl ## see maxpear for more details.

## ------------------------------------------------------------------------
clust

## ------------------------------------------------------------------------
## using Hierarchical Clustering method to obtain the clustering results ##
CL = cutree(hclust(as.dist(1-mat)),k=4)
CL

## ------------------------------------------------------------------------
## plot similarity matrix ##
require(lattice,quietly=TRUE)
n = length(unique(data$ID))
x = rep(1:n,times=n)
y = rep(1:n,each=n)
z = as.vector(mat)
levelplot(z~x*y,col.regions=rev(gray.colors(n^2)), xlab = "Subject ID",ylab = "Subject ID")

## ----  eval=FALSE--------------------------------------------------------
#  ## Clustering based only on intercepts ##
#  res = BClustLonG(data, iter=500, thin=2,savePara=FALSE, infoVar="int",factor=TRUE)
#  ## clustering based on intercepts and slopes ##
#  ## assume diagonal covariance matrix for the intecepts and slopes ##
#  res = BClustLonG(data, iter=500, thin=2,savePara=FALSE, infoVar="both",factor=FALSE)

