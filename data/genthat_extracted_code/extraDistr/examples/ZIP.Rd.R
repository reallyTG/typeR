library(extraDistr)


### Name: ZIP
### Title: Zero-inflated Poisson distribution
### Aliases: ZIP dzip pzip qzip rzip
### Keywords: distribution

### ** Examples


x <- rzip(1e5, 6, 0.33)
xx <- -2:20
plot(prop.table(table(x)), type = "h")
lines(xx, dzip(xx, 6, 0.33), col = "red")

xx <- seq(0, 20, by = 0.01)
plot(ecdf(x))
lines(xx, pzip(xx, 6, 0.33), col = "red")




