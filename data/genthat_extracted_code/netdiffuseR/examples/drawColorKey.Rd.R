library(netdiffuseR)


### Name: drawColorKey
### Title: Draw a color key in the current device
### Aliases: drawColorKey
### Keywords: misc

### ** Examples

set.seed(166)
x <- rnorm(100)
col <- colorRamp(c("lightblue", "yellow", "red"))((x - min(x))/(max(x) - min(x)))
col <- rgb(col, maxColorValue = 255)
plot(x, col=col, pch=19)
drawColorKey(x, nlevels = 100, border="transparent",
 main="Key\nLike A\nBoss")



