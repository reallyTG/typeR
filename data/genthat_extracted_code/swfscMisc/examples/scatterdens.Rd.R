library(swfscMisc)


### Name: scatterdens
### Title: Scatter Plot with Density Margins
### Aliases: scatterdens scatterhist

### ** Examples

x <- rnorm(100)
y <- rlnorm(100)
op <- par(ask = TRUE)
scatterdens(x, y, xlab = "x", ylab = "y")
par(op)




