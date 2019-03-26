library(CoClust)


### Name: CoClust
### Title: Copula-Based Clustering Algorithm
### Aliases: CoClust
### Keywords: cluster multivariate

### ** Examples

## ******************************************************************
## 1. builds a 3-variate copula with different margins
##    (Gaussian, Gamma, Beta)
##
## 2. generates a data matrix xm with 15 rows and 21 columns and
##    builds the matrix of the true cluster indexes
##
## 3. applies the CoClust to the rows of xm and recovers the
##    multivariate dependence structure of the data
## ******************************************************************

## Step 1. **********************************************************
n      <- 105             # total number of observations
n.col  <- 21              # number of columns of the data matrix m
n.marg <- 3               # dimension of the copula
n.row  <- n*n.marg/n.col  # number of rows of the data matrix m

theta  <- 10
copula <- frankCopula(theta, dim = n.marg)
mymvdc <- mvdc(copula, c("norm", "gamma", "beta"),list(list(mean=7, sd=2),
                list(shape=3, rate=4), list(shape1=2, shape2=1)))

## Step 2. **********************************************************
set.seed(11)
x.samp <- rMvdc(n, mymvdc)
xm     <- matrix(x.samp, nrow = n.row, ncol = n.col, byrow=TRUE)

index.true <-  matrix(1:15,5,3)
colnames(index.true) <- c("Cluster 1","Cluster 2", "Cluster 3")

## Step 3. **********************************************************

clust <- CoClust(xm, dimset = 2:4, noc=2, copula="frank",
                 method.ma="empirical", method.c="ml",writeout=1)
clust
clust@"Number.of.Clusters"
clust@"Dependence"$Param
clust@"Data.Clusters"
index.clust <- clust@"Index.Matrix"

## compare with index.true
index.clust
index.true
##



