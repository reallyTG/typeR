library(IncDTW)


### Name: norm
### Title: Time Series Normalisation
### Aliases: norm
### Keywords: classif cluster ts

### ** Examples

x <- cumsum(rnorm(100, 10, 5))
y <- norm(x, "01")
z <- norm(x, "z")



