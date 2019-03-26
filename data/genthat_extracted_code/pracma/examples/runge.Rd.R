library(pracma)


### Name: runge
### Title: Runge Function
### Aliases: runge
### Keywords: math

### ** Examples

## Not run: 
##D x <- seq(-1, 1, length.out = 101)
##D y <- runge(x)
##D plot(x, y, type = "l", lwd = 2, col = "navy", ylim = c(-0.2, 1.2))
##D grid()
##D 
##D n <- c(6, 11, 16)
##D for (i in seq(along=n)) {
##D     xp <- seq(-1, 1, length.out = n[i])
##D     yp <- runge(xp)
##D     p  <- polyfit(xp, yp, n[i]-1)
##D     y  <- polyval(p, x)
##D     lines(x, y, lty=i) }
## End(Not run)



