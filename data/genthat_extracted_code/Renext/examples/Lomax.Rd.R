library(Renext)


### Name: Lomax
### Title: Lomax distribution
### Aliases: Lomax dlomax plomax qlomax rlomax
### Keywords: distribution

### ** Examples

shape <- 5; scale <- 10
xl <- qlomax(c(0.00, 0.99), scale = scale, shape = shape)
x <- seq(from = xl[1], to = xl[2], length.out = 200)
f <- dlomax(x, scale = scale, shape = shape)
plot(x, f, type = "l", main = "Lomax density")
F <- plomax(x, scale = scale, shape = shape)
plot(x, F, type ="l", main ="Lomax distribution function")



