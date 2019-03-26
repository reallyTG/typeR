library(mdendro)


### Name: linkage
### Title: Linkage Methods for Hierarchical Clustering
### Aliases: linkage

### ** Examples

## distances between 10 cities in the US
data(UScitiesD)

## unweighted arithmetic linkage (UPGMA)
lnk1 <- linkage(UScitiesD, method="arithmetic", weighted=FALSE)
plot(lnk1, main="linkage(arithmetic, U)")

## weighted arithmetic linkage (WPGMA)
lnk2 <- linkage(UScitiesD, method="arithmetic", weighted=TRUE)

## equivalence with hclust, except for the ordering of the leaves
hcl2 <- as.dendrogram(hclust(UScitiesD, method="mcquitty"))
sum(abs(ultrametric(lnk2) - ultrametric(hcl2)))  # 0
opar <- par(mfrow=c(1, 2))
plot(lnk2, main="linkage(arithmetic, W)")
plot(hcl2, main="hclust(mcquitty)")
par(opar)

## unweighted versatile linkage, with par.method=-0.6
lnk3 <- linkage(UScitiesD, method="versatile", weighted=FALSE,
                par.method=-0.6)
plot(lnk3, main="linkage(versatile, -0.6, U)")

## cophenetic correlation coefficient
cor(UScitiesD, ultrametric(lnk1))  # 0.8101937
cor(UScitiesD, ultrametric(lnk2))  # 0.8076422
cor(UScitiesD, ultrametric(lnk3))  # 0.8163286




