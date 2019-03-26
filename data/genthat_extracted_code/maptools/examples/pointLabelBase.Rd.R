library(maptools)


### Name: pointLabel
### Title: Label placement for points to avoid overlaps
### Aliases: pointLabel
### Keywords: aplot

### ** Examples

n <- 50
x <- rnorm(n)*10
y <- rnorm(n)*10
plot(x, y, col = "red", pch = 20)
pointLabel(x, y, as.character(round(x,5)), offset = 0, cex = .7)

plot(x, y, col = "red", pch = 20)
pointLabel(x, y, expression(over(alpha, beta[123])), offset = 0, cex = .8)




