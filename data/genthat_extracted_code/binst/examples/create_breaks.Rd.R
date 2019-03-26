library(binst)


### Name: create_breaks
### Title: A convenience functon for creating breaks with various methods.
### Aliases: create_breaks

### ** Examples

kmeans_breaks <- create_breaks(1:10)
create_bins(1:10, kmeans_breaks)

# passing the k means parameter "centers" = 4
kmeans_breaks <- create_breaks(1:10, list(centers=4))
create_bins(1:10, kmeans_breaks)

entropy_breaks <- create_breaks(1:10, rep(c(1,2), each = 5), method="entropy")
create_bins(1:10, entropy_breaks)

dt_breaks <- create_breaks(iris$Sepal.Length, iris$Species, method="dt")
create_bins(iris$Sepal.Length, dt_breaks)



