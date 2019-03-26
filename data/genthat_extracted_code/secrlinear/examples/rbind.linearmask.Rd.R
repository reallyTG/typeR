library(secrlinear)


### Name: rbind.linearmask
### Title: Combine linearmask Objects
### Aliases: rbind.linearmask
### Keywords: manip

### ** Examples


x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
xy2 <- data.frame(x = x*100, y = cos(x)*300)
test <- read.linearmask(data = xy, spacing = 20)
test2 <- read.linearmask(data = xy2, spacing = 20)

plot(rbind(test, test2))




