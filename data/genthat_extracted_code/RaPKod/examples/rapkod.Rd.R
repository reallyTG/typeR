library(RaPKod)


### Name: rapkod
### Title: RaPKod: Random Projections Kernel Outlier Detection
### Aliases: rapkod

### ** Examples

data(iris)

##Define data frame with non-outliers
inliers = iris[sample(which(iris$Species!="setosa"), 100, replace=FALSE),
                                              -which(names(iris)=="Species")]
##Define data frame with outliers
outliers = iris[which(iris$Species=="setosa"),-which(names(iris)=="Species")]


X = rbind(inliers, outliers)

ref.n = 50
result <- rapkod(X, ref.n = ref.n, use.tested.inlier = FALSE, alpha = 0.05)


##False alarm error ratio obtained on tested non-outliers (should be close to 0.05)
mean(result$pv[1:(nrow(inliers)-ref.n)]<0.05, na.rm = TRUE)
##Missed detection error ratio obtained on tested outliers (should be close to 0)
mean(result$pv[-(1:(nrow(inliers)-ref.n))]>0.05, na.rm = TRUE)
  



