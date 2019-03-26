library(pracma)


### Name: detrend
### Title: Remove Linear Trends
### Aliases: detrend
### Keywords: math

### ** Examples

t <- 1:9
x <- c(0, 2, 0, 4, 4, 4, 0, 2, 0)
x - detrend(x, 'constant')
x - detrend(x, 'linear')

y <- detrend(x, 'linear', 5)
## Not run: 
##D plot(t, x, col="blue")
##D lines(t, x - y, col="red")
##D grid()
## End(Not run)



