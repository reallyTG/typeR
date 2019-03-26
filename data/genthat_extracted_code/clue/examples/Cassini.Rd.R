library(clue)


### Name: Cassini
### Title: Cassini Data
### Aliases: Cassini
### Keywords: datasets

### ** Examples

data("Cassini")
op <- par(mfcol = c(1, 2))
## Plot the data set:
plot(Cassini$x, col = as.integer(Cassini$classes),
     xlab = "", ylab = "")
## Create a "random" k-means partition of the data:
set.seed(1234)
party <- kmeans(Cassini$x, 3)
## And plot that.
plot(Cassini$x, col = cl_class_ids(party),
     xlab = "", ylab = "")
## (We can see the problem ...)
par(op)



