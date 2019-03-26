library(SODC)


### Name: SODC-package
### Title: Sparse Optimal Discriminant Clustering
### Aliases: SODC-package SODC
### Keywords: package

### ** Examples

# generate a dataset having 150 observations and 10 varialbles,
# the first 2 are informative varialbes,
# the other 8 are noise varialbes. 
# This dataset has 3 clusters. 
# the returned data has two items, x is the dataset, y is the true clustering assignment. 

data.all = my.normdata.gen(2.4,10,150,2)
data = data.all$x

# get kappa coefficient value clus1 and clus2 
# clus1 and clus2 are varialbe selection results for input data matrix.
clus1 = c(1,2,3)
clus2 = c(1,2,6)
p = ncol(data)
clust.kappa(clus1, clus2, p)

# perform hierarchical clustering on input data matrix, the desired clusters numbers is 3.
hclust.wrap(data, centers=3)

# choose optimal lambda2 for a given dataset.
rlt = odc.optimallambda2(data, centers=3, cv.num = 5, lambda2.idx = seq(-3, 3, by = 6/20))
rlt$opt.lambda2

# get ODC component.
rlt.odc = odc.cv(data, k=3, lambda2=0.01)
rlt.odc$Z

#perform ODC clustering, use defualt setting.
rlt.odc.res = odc.clust(data, centers=3)
rlt.odc.res

# get SODC component.
rlt.SODC = my.lasso.classify(data, c=3, lambda1=0.1, lambda2=0.01, tol = 10^(-10), iter.max = 50)
rlt.SODC$Z

# choose optimal lambda1 for a given dataset.
rlt1 = sodc.optimallambda1.boot.all(data, center=3, boot.num = 5, l1.idx = seq(-3, 3, by = 6/10))

# perform SODC clustering given l1 and l2
rlt.sodc.res = sodc.clust(data, centers=3, l1=1, l2=15.8)
rlt.sodc.res



