library(FUNTA)


### Name: FUNTA-package
### Title: Obtain FUNTA and rFUNTA pseudo-depth for a given functional
###   dataset
### Aliases: FUNTA-package
### Keywords: package classif robust

### ** Examples

x <- seq(0, 2*pi, by = 0.01)
y1 <- sin(x)
y2 <- sin(1.02*x)
y3 <- cos(x)
y <- rbind(y1, y2, y3)
FUNTA(y, tick.dist = 0.01)
rFUNTA(y, tick.dist = 0.01)



