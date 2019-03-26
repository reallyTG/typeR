library(fdasrvf)


### Name: kmeans_align
### Title: K-Means Clustering and Alignment
### Aliases: kmeans_align
### Keywords: alignment clustering srsf

### ** Examples

data("growth_vel")
# use more iterations for accuracy
out <- kmeans_align(growth_vel$f,growth_vel$time, K=2, MaxItr=1, showplot=FALSE)



