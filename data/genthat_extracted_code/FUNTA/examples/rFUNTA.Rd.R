library(FUNTA)


### Name: rFUNTA
### Title: Obtain rFUNTA pseudo-depth values
### Aliases: rFUNTA
### Keywords: classif robust

### ** Examples

x <- seq(0, 2*pi, by = 0.01)
y1 <- sin(x)
y2 <- sin(1.02*x)
y3 <- cos(x)
y <- rbind(y1, y2, y3)
rFUNTA(y, tick.dist = 0.01)



