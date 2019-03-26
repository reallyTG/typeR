library(tbart)


### Name: tb.raw
### Title: Teitz-Bart algorithm applied to a 'raw' distance matrix
### Aliases: tb.raw

### ** Examples

x1 <- rnorm(100)
y1 <- rnorm(100)
d <- as.matrix(dist(cbind(x1,y1)))
tb.raw(d,c(1,2))



