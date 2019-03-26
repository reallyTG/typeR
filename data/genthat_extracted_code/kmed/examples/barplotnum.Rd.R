library(kmed)


### Name: barplotnum
### Title: Barplot of each cluster for numerical variables data set.
### Aliases: barplotnum

### ** Examples

dat <- iris[,1:4]
memb <- cutree(hclust(dist(dat)),3)
barplotnum(dat, memb)
barplotnum(dat, memb, 2)




