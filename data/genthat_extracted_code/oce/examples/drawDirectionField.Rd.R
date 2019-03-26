library(oce)


### Name: drawDirectionField
### Title: Draw a Direction Field
### Aliases: drawDirectionField

### ** Examples

library(oce)
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type='n')
drawDirectionField(x=rep(0, 2), y=rep(0, 2), u=c(1, 1), v=c(1, -1), scalex=0.5, add=TRUE)
plot(c(-1.5, 1.5), c(-1.5, 1.5), xlab="", ylab="", type='n')
drawDirectionField(x=rep(0, 2), y=rep(0, 2), u=c(1, 1), v=c(1, -1), scalex=0.5, add=TRUE,
                   type=2)

## 2D example
x <- seq(-2, 2, 0.1)
y <- x
xx <- expand.grid(x, y)[,1]
yy <- expand.grid(x, y)[,2]
z <- matrix(xx*exp(-xx^2 -yy^2), nrow=length(x))
gz <- grad(z, x, y)
drawDirectionField(x, y, gz$gx, gz$gy, scalex=0.5, type=2, len=0.02)
oceContour(x, y, z, add=TRUE)



