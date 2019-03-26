library(numbers)


### Name: moebius
### Title: Moebius Function
### Aliases: moebius mertens

### ** Examples

sapply(1:16, moebius)
sapply(1:16, mertens)

## Not run: 
##D x <- 1:50; y <- sapply(x, moebius)
##D plot(c(1, 50), c(-3, 3), type="n")
##D grid()
##D points(1:50, y, pch=18, col="blue")
##D 
##D x <- 1:100; y <- sapply(x, mertens)
##D plot(c(1, 100), c(-5, 3), type="n")
##D grid()
##D lines(1:100, y, col="red", type="s")
## End(Not run)



