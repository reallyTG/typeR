## ---- eval=FALSE---------------------------------------------------------
#  install.packages("ADPclust", repos = "http://cran.us.r-project.org")

## ------------------------------------------------------------------------
library(ADPclust)

## ---- fig.height=5, fig.width=9------------------------------------------
# Load a simple simulated data set with 3 clusters.
data(clust3)
ans <- adpclust(clust3)
# Above is equivalent to 
# ans <- adpclust(clust3, centroids = "auto")
plot(ans)

## ------------------------------------------------------------------------
summary(ans)

## ---- eval=FALSE---------------------------------------------------------
#  # A simple wrapper of dist() with normalization
#  distm <- FindDistm(clust3, normalize = TRUE)
#  ans.distm <- adpclust(distm = distm, p = 2)

## ---- eval=FALSE---------------------------------------------------------
#  # Result is similar. Not shown.
#  ans <- adpclust(clust3, htype = "ROT")

## ---- eval=FALSE---------------------------------------------------------
#  # Setting a single h. Result not shown.
#  ans <- adpclust(clust3, h = 10)
#  # Setting a vector of testing h's. Result not shown.
#  ans <- adpclust(clust3, h = c(10, 12, 18))
#  # Setting h to the 'ROT' bandwidth. result not shown.
#  ans <- adpclust(clust3, h = ROT(clust3))

## ---- fig.height=5, fig.width=5------------------------------------------
# Setting different testing cluster numbers
ans <- adpclust(clust3, nclust = 2:15)
# Specifying one cluster number. 
ans <- adpclust(clust3, nclust = 3)
plot(ans, to.plot = "fd")

## ---- fig.height=5, fig.width=9------------------------------------------
# Load a data set with 10 clusters
data(clust10)
ans <- adpclust(clust10, f.cut = 0.1, nclust = 5:13, h = ROT(clust10))
plot(ans)

## ---- fig.height=5, fig.width=9------------------------------------------
ans <- adpclust(clust10, f.cut = 0.95, nclust = 5:13, h = ROT(clust10))
plot(ans)

## ---- eval = FALSE-------------------------------------------------------
#  data(clust5.1)
#  ans <- adpclust(clust5.1, centroids = "user")

