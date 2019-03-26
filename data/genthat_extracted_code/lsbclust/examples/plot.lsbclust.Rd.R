library(lsbclust)


### Name: plot.lsbclust
### Title: Plot method for class 'lsbclust'
### Aliases: plot.lsbclust
### Keywords: hplot

### ** Examples

data("dcars")
m <- lsbclust(data = dcars, margin = 3, delta = c(1, 1, 1, 1), nclust = 5, nstart = 1)
plot(m)



