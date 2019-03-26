library(condvis)


### Name: makepath
### Title: Make a default path for conditional tour
### Aliases: makepath

### ** Examples

d <- data.frame(x = runif(500), y = runif(500))
plot(d)
mp1 <- makepath(d, 5)
points(mp1$centers, type = "b", col = "blue", pch = 16)
mp2 <- makepath(d, 40)
points(mp2$centers, type = "b", col = "red", pch = 16)




