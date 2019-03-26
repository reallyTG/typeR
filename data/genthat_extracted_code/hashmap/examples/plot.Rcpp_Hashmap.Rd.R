library(hashmap)


### Name: plot
### Title: Plot method for Hashmap class
### Aliases: plot plot.Rcpp_Hashmap

### ** Examples


x <- hashmap(1:20, rnorm(20))
plot(x)
plot(x, type = 'p', pch = 20, col = 'red')

y <- hashmap(Sys.Date() + 1:20, rnorm(20))
plot(y, type = 'h', col = 'blue', lwd = 3)



