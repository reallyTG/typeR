library(oce)


### Name: curl
### Title: Curl of 2D vector field
### Aliases: curl

### ** Examples

library(oce)
## 1. Shear flow with uniform curl.
x <- 1:4
y <- 1:10
u <- outer(x, y, function(x, y) y/2)
v <- outer(x, y, function(x, y) -x/2)
C <- curl(u, v, x, y, FALSE)

## 2. Rankine vortex: constant curl inside circle, zero outside
rankine <- function(x, y)
{
    r <- sqrt(x^2 + y^2)
    theta <- atan2(y, x)
    speed <- ifelse(r < 1, 0.5*r, 0.5/r)
    list(u=-speed*sin(theta), v=speed*cos(theta))
}
x <- seq(-2, 2, length.out=100)
y <- seq(-2, 2, length.out=50)
u <- outer(x, y, function(x, y) rankine(x, y)$u)
v <- outer(x, y, function(x, y) rankine(x, y)$v)
C <- curl(u, v, x, y, FALSE)
## plot results
par(mfrow=c(2, 2))
imagep(x, y, u, zlab="u", asp=1)
imagep(x, y, v, zlab="v", asp=1)
imagep(x, y, C$curl, zlab="curl", asp=1)
hist(C$curl, breaks=100)



