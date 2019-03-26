library(lsbclust)


### Name: plot.col.kmeans
### Title: Plot method for class 'col.kmeans'
### Aliases: plot.col.kmeans
### Keywords: hplot

### ** Examples

data("dcars")
m <- orc.lsbclust(data = dcars, margin = 3, delta = c(1,1,1,1), nclust = 5, type = "columns")
plot(m)



