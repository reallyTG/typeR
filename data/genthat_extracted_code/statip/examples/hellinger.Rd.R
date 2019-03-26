library(statip)


### Name: hellinger
### Title: Hellinger distance
### Aliases: hellinger

### ** Examples

x <- rnorm(200, 0, 2)
y <- rnorm(1000, 10, 15)
hellinger(x, y, -Inf, Inf)
hellinger(x, y, -Inf, Inf, method = 2)




