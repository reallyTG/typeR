library(pracma)


### Name: einsteinF
### Title: Einstein Functions
### Aliases: einsteinF

### ** Examples

## Not run: 
##D x1 <- seq(-4, 4, length.out = 101)
##D y1 <- einsteinF(1, x1)
##D plot(x1, y1, type = "l", col = "red",
##D              xlab = "", ylab = "", main = "Einstein Function E1(x)")
##D grid()
##D 
##D y2 <- einsteinF(2, x1)
##D plot(x1, y2, type = "l", col = "red",
##D              xlab = "", ylab = "", main = "Einstein Function E2(x)")
##D grid()
##D 
##D x3 <- seq(0, 5, length.out = 101)
##D y3 <- einsteinF(3, x3)
##D plot(x3, y3, type = "l", col = "red",
##D              xlab = "", ylab = "", main = "Einstein Function E3(x)")
##D grid()
##D 
##D y4 <- einsteinF(4, x3)
##D plot(x3, y4, type = "l", col = "red",
##D              xlab = "", ylab = "", main = "Einstein Function E4(x)")
##D grid()
## End(Not run)



