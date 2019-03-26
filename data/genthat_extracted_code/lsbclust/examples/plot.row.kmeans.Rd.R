library(lsbclust)


### Name: plot.row.kmeans
### Title: Plot method for class 'row.kmeans'
### Aliases: plot.row.kmeans
### Keywords: hplot

### ** Examples

data("dcars")
m <- orc.lsbclust(data = dcars, margin = 3, delta = c(1,1,1,1), nclust = 5, type = "rows")
plot(m)



