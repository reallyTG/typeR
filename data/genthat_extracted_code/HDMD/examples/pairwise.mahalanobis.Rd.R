library(HDMD)


### Name: pairwise.mahalanobis
### Title: Mahalanobis distances for grouped data
### Aliases: pairwise.mahalanobis

### ** Examples


data(bHLH288)
grouping = t(bHLH288[,1])
bHLH_Seq = as.vector(bHLH288[,2])
bHLH_pah = FactorTransform(bHLH_Seq, alignment=TRUE)

Mahala1 = pairwise.mahalanobis(bHLH_pah, grouping, digits = 3)
D = sqrt(Mahala1$distance)
D




