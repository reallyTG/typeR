library(pracma)


### Name: neville
### Title: Neville's Method
### Aliases: neville
### Keywords: math

### ** Examples

p <- Poly(c(1, 2, 3))
fp <- function(x) polyval(p, x)

x <- 0:4; y <- fp(x)
xx <- linspace(0, 4, 51)
yy <- numeric(51)
for (i in 1:51) yy[i] <- neville(x, y, xx[i])

## Not run: 
##D ezplot(fp, 0, 4)
##D points(xx, yy)
## End(Not run)



