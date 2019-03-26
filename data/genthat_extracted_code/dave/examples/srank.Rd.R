library(dave)


### Name: srank
### Title: Ranking species by IndVal or F-value
### Aliases: srank srank.default print.srank srank2
### Keywords: arith multivariate

### ** Examples

# Starts with classifying releves by cluster analysis
dd<- vegdist(nveg^0.5,method="euclid")         # dd is distance matrix
o.clust<- hclust(dd,method="ward")             # clustering
groups<- as.factor(cutree(o.clust,k=3))        # forming 3 groups

# Applies ranking and prints ordered table of species (the columns)
o.srank<- srank(nveg,groups,method="jancey",y=0.5)
o.srank



