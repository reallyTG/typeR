library(secrlinear)


### Name: read.linearmask
### Title: Import Linear Habitat Mask
### Aliases: read.linearmask
### Keywords: IO

### ** Examples


x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
test <- read.linearmask(data = xy, spacing = 20)
plot(test)

xy2 <- data.frame(x = x*100, y = cos(x)*300)
test2 <- read.linearmask(data = xy2, spacing = 20)

plot(test2, add = TRUE)




