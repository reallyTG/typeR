library(rootWishart)


### Name: singleWishart
### Title: Distribution of the largest root
### Aliases: singleWishart doubleWishart doubleWishart

### ** Examples

x1 <- seq(0, 30, length.out = 50)
y1 <- singleWishart(x1, p = 5, n = 10)
plot(x1, y1, type='l')

x2 <- seq(0, 1, length.out = 50)
y2 <- doubleWishart(x2, p = 10, n = 10, m = 200)
plot(x2, y2, type='l')



