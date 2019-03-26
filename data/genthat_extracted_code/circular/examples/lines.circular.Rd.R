library(circular)


### Name: lines.circular
### Title: Add Connected Line Segments to a Circular Plot
### Aliases: lines.circular
### Keywords: hplot

### ** Examples


x <- rvonmises(20, circular(0), 10)
y <- runif(20, 0.5, 1)

plot(x, shrink=2)
lines(x, y)




