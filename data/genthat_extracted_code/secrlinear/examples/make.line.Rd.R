library(secrlinear)


### Name: make.line
### Title: Linear Detector Array
### Aliases: make.line
### Keywords: datagen

### ** Examples


x <- seq(0, 4*pi, length = 200)
xy <- data.frame(x = x*100, y = sin(x)*300)
mask <- read.linearmask(data = xy, spacing = 20)

trps <- make.line(mask, n = 15, startbuffer = 1000, by = 50)
plot(mask)
plot(trps, add = TRUE)




