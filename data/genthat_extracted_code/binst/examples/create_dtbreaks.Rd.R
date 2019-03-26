library(binst)


### Name: create_dtbreaks
### Title: Create breaks using decision trees (recursive partitioning)
### Aliases: create_dtbreaks

### ** Examples

dt_breaks <- create_breaks(iris$Sepal.Length, iris$Species, method="dt")
create_bins(iris$Sepal.Length, dt_breaks)



