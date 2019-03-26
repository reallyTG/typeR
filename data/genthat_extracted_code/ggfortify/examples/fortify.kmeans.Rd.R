library(ggfortify)


### Name: fortify.kmeans
### Title: Convert cluster instances to 'data.frame'
### Aliases: fortify.kmeans

### ** Examples

fortify(stats::kmeans(iris[-5], 3))
fortify(stats::kmeans(iris[-5], 3), data = iris)
fortify(cluster::clara(iris[-5], 3))
fortify(cluster::fanny(iris[-5], 3))
fortify(cluster::pam(iris[-5], 3), data = iris)



