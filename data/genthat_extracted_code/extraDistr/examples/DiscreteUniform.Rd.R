library(extraDistr)


### Name: DiscreteUniform
### Title: Discrete uniform distribution
### Aliases: DiscreteUniform ddunif pdunif qdunif rdunif
### Keywords: distribution

### ** Examples


x <- rdunif(1e5, 1, 10) 
xx <- -1:11
plot(prop.table(table(x)), type = "h")
lines(xx, ddunif(xx, 1, 10), col = "red")
hist(pdunif(x, 1, 10))
xx <- seq(-1, 11, by = 0.01)
plot(ecdf(x))
lines(xx, pdunif(xx, 1, 10), col = "red")




