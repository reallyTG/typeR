library(extraDistr)


### Name: ZIB
### Title: Zero-inflated binomial distribution
### Aliases: ZIB dzib pzib qzib rzib
### Keywords: distribution

### ** Examples


x <- rzib(1e5, 10, 0.6, 0.33)
xx <- -2:20
plot(prop.table(table(x)), type = "h")
lines(xx, dzib(xx, 10, 0.6, 0.33), col = "red")

xx <- seq(0, 20, by = 0.01)
plot(ecdf(x))
lines(xx, pzib(xx, 10, 0.6, 0.33), col = "red")




