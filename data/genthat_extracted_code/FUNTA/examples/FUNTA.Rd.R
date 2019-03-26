library(FUNTA)


### Name: FUNTA
### Title: Obtain FUNTA pseudo-depth values
### Aliases: FUNTA
### Keywords: classif

### ** Examples

x <- seq(0, 2*pi, by = 0.01)
y1 <- sin(x)
y2 <- sin(1.02*x)
y3 <- cos(x)
y <- rbind(y1, y2, y3)
FUNTA(y, tick.dist = 0.01)



