library(clv)


### Name: cls.scatt.data
### Title: Intercluster distances and intracluster diameters - Internal
###   Measures
### Aliases: cls.scatt.data cls.scatt.diss.mx
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
pam.mod <- pam(iris.data,5) # create five clusters
v.pred <- as.integer(pam.mod$clustering) # get cluster ids associated to given data objects

# compute intercluster distances and intracluster diameters
cls.scatt1 <- cls.scatt.data(iris.data, v.pred)
cls.scatt2 <- cls.scatt.data(iris.data, v.pred, dist="manhattan")
cls.scatt3 <- cls.scatt.data(iris.data, v.pred, dist="correlation")

# the same using dissimilarity matrix
iris.diss.mx <- as.matrix(daisy(iris.data))
cls.scatt4 <- cls.scatt.diss.mx(iris.diss.mx, v.pred)



