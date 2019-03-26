library(flexclust)


### Name: conversion
### Title: Conversion Between S3 Partition Objects and KCCA
### Aliases: as.kcca as.kcca.hclust as.kcca.kmeans as.kcca.partition
###   as.kcca.skmeans coerce,kccasimple,kmeans-method Cutree
### Keywords: cluster

### ** Examples

data(Nclus)

cl1 <- kmeans(Nclus, 4)
cl1
cl1a <- as.kcca(cl1, Nclus)
cl1a
cl1b <- as(cl1a, "kmeans")

## Don't show: 
stopifnot(all.equal(cl1$cluster, clusters(cl1a)))
stopifnot(all.equal(cl1$cluster, cl1b$cluster))
stopifnot(all.equal(cl1$withinss, cl1b$withinss))
## End(Don't show)

library("cluster")
cl2 <- pam(Nclus, 4)
cl2
cl2a <- as.kcca(cl2)
cl2a
## the same
cl2b <- as.kcca(cl2, Nclus)
cl2b

## Don't show: 
stopifnot(all.equal(clusters(cl2a), clusters(cl2b)))
stopifnot(all.equal(parameters(cl2a), parameters(cl2b)))
## End(Don't show)

## hierarchical clustering
hc <- hclust(dist(USArrests))
plot(hc)
rect.hclust(hc, k=3)
c3 <- Cutree(hc, k=3)
k3 <- as.kcca(hc, USArrests, k=3)
barchart(k3)
table(c3, clusters(k3))



